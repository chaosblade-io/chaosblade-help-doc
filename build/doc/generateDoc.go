package main

import (
	"bytes"
	"fmt"
	"github.com/chaosblade-io/chaosblade-spec-go/spec"
	"github.com/chaosblade-io/chaosblade-spec-go/util"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"io"
	"io/ioutil"
	"log"
	"os"
	"path"
	"path/filepath"
)

var docPath = "zh-CN/v0.6.1"
var examplePath = path.Join(docPath, "example")
var actionTemplateFile = "template/template_action.md"
var modelTemplateFile = "template/template_model.md"
var summaryTemplateFile = "template/template_summary.md"
var prefix = "blade create "
var specFile = "target/chaosblade-0.6.0/bin/chaosblade.spec.yaml"

func main() {

	models := getModels()
	cmd := &cobra.Command{
		Use: "SUMMARY",
	}
	prepender := fileSummaryPrepender(models.Models)
	err := genMarkdownCustom(cmd, "./", prepender)
	if err != nil {
		log.Fatal(err)
	}

	for _, model := range models.Models {
		scope := getScope(model)
		if len(model.Actions()) > 1 {
			cmd = &cobra.Command{
				Use: prefix + scope + model.ExpName,
			}
			prepender := fileModelPrepender(cmd, model)
			err := genMarkdownCustom(cmd, docPath, prepender)
			if err != nil {
				log.Fatal(err)
			}
		}
		for _, action := range model.Actions() {
			cmd = &cobra.Command{
				Use: prefix + scope + model.ExpName + " " + action.Name(),
			}
			prepender := fileActionPrepender(cmd, model, action)
			err := genMarkdownCustom(cmd, docPath, prepender)
			if err != nil {
				log.Fatal(err)
			}
		}
	}
}

func getScope(model spec.ExpCommandModel) string {
	var scope string
	if model.ExpScope == "host" {
		scope = ""
	} else if model.ExpScope == "container" || model.ExpScope == "node" || model.ExpScope == "pod" {
		scope = "k8s " + model.ExpScope + "-"
	} else {
		scope = model.ExpScope + " "
	}
	return scope
}

func getModels() *spec.Models {
	models, err := util.ParseSpecsToModel(specFile, nil)
	if err != nil {
		logrus.Fatalf("parse java spec failed, %s", err)
	}
	return models
}

func fileModelPrepender(cmd *cobra.Command, model spec.ExpCommandModel) string {
	data, err := ioutil.ReadFile(modelTemplateFile)
	if err != nil {
		fmt.Println("File reading error", err)
	}

	introduction := model.LongDesc() + "\n"
	for _, action := range model.Actions() {
		scope := getScope(model)

		actionCommand := prefix + scope + model.ExpName + " " + action.Name()
		introduction = introduction + "* [" + actionCommand + "](" + actionCommand + ".md)\t" + action.ShortDesc() + "\n"
	}

	var actualExample string
	example, exampleErr := ioutil.ReadFile(examplePath + "/" + cmd.Use + ".md")
	if exampleErr == nil {
		actualExample = string(example)
	} else {
		actualExample =  model.Example() + "\n"
	}

	return fmt.Sprintf(
		string(data),
		prefix+model.ExpName,
		introduction,
		actualExample)
}

func fileActionPrepender(cmd *cobra.Command, model spec.ExpCommandModel, action spec.ExpActionCommandSpec) string {
	data, err := ioutil.ReadFile(actionTemplateFile)
	if err != nil {
		fmt.Println("File reading error", err)
	}

	parameter := ""
	for _, match := range action.Matchers() {
		parameter = parameter + "--" + match.FlagName() + "\n\t" + match.FlagDesc() + "\n"
	}
	for _, flag := range action.Flags() {
		parameter = parameter + "--" + flag.FlagName() + "\n\t" + flag.FlagDesc() + "\n"
	}

	var actualExample string
	example, exampleErr := ioutil.ReadFile(examplePath + "/" + cmd.Use + ".md")
	if exampleErr == nil {
		actualExample = string(example)
	} else {
		example := action.Example()
		if example.Introduction != "" {
			actualExample = example.Introduction + "\n";
		}
		if example.ExampleCommands != nil && len(example.ExampleCommands) > 0 {
			for _, process := range example.ExampleCommands {
				var tmp string
				if process.Annotation != "" {
					tmp = "# " + process.Annotation + "\n"
				}
				if process.Command != "" {
					tmp = tmp + process.Command + "\n"
				}
				if process.CommandResult != "" {
					tmp = tmp + process.CommandResult + "\n"
				}
				if tmp != ""{
					actualExample = actualExample + "````\n" + tmp + "````\n";
				}
				if process.ImageUrl != "" {
					actualExample = actualExample + "![](" + process.ImageUrl + ")" + "\n"
				}
			}
		}
		if example.Summary != "" {
			actualExample = actualExample + example.Summary;
		}
	}

	return fmt.Sprintf(
		string(data),
		prefix+model.ExpName+" "+action.Name(),
		action.LongDesc(),
		parameter,
		actualExample)
}

func fileSummaryPrepender(models []spec.ExpCommandModel) string {
	data, err := ioutil.ReadFile(summaryTemplateFile)
	if err != nil {
		fmt.Println("File reading error", err)
	}

	var content string
	for _, model := range models {
		scope := getScope(model)
		command := prefix + scope + model.ExpName
		if len(model.ExpActions) == 1 {
			content = content + "* [" + command + "](" + docPath + "/" + command + " " + model.ExpActions[0].Name() + ".md)" + "\n"
		} else {
			content = content + "* [" + command + "](" + docPath + "/" + command + ".md)" + "\n"
			for _, action := range model.ExpActions {
				command := prefix + scope + model.ExpName + " " + action.Name()
				content = content + "\t* [" + command + "](" + docPath + "/" + command + ".md)" + "\n"
			}
		}
	}

	return fmt.Sprintf(string(data), content)
}

func genMarkdownCustom(cmd *cobra.Command, dir string,
	content string) error {
	basename := cmd.Use + ".md"

	filename := filepath.Join(dir, basename)
	f, err := os.Create(filename)
	if err != nil {
		return err
	}
	defer f.Close()
	if _, err := io.WriteString(f, content); err != nil {
		return err
	}
	buf := new(bytes.Buffer)
	_, err = buf.WriteTo(f)
	if err != nil {
		return err
	}
	return nil
}
