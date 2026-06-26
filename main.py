import argparse
import shutil
import datetime

vault = "~/Projects/parakasten/test-vault/"
time = datetime.datetime.now()
template = vault + "parakasten/template.md"

parser = argparse.ArgumentParser(description="handles notes")

parser.add_argument("title", metavar="title", type="str", help="enter note title")

args = parser.parse_args()

title = args.title

if not args.title.exists():
    title = ""

zettelTitle = vault + time.strftime("%y%m%%d-") + title + ".md"

shutil.copyfile(template, zettelTitle)
