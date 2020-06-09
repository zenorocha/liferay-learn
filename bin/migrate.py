import os
import re
import shutil
import sys

if __name__ == "__main__":

    if (len(sys.argv) < 2):
        print("Usage: python migrate.py article [dest_folder]\nIMPORTANT: Run this script in the folder containing the liferay-docs article so that it copies the liferay-docs image files to [dest_folder]/images.")
        sys.exit()

    article = sys.argv[1]

    dest_folder = "."
    if (len(sys.argv)) > 2:
        dest_folder = sys.argv[2]

    # Copy the article to the destination folder

    if not (os.path.isdir(dest_folder)):
        os.mkdir(dest_folder)

    new_article_path = dest_folder + "/" + article.split('.markdown')[0] + ".md"

    # Copy referenced image files

    image_folder = dest_folder + "/images"

    file = open(article)
    content = file.read()
    file.close()

    png_split = content.split('.png)')

    images = []

    png_split_len = len(png_split) - 1
    ii = 0;

    while (ii < png_split_len):
        paran_split = png_split[ii].split('(')

        if (len(paran_split) > 1):
            image = paran_split[len(paran_split) - 1] + '.png'
            images.append(image)

        ii = ii + 1

    if (len(images) > 0):

        if not os.path.isdir(image_folder):
            os.mkdir(image_folder)

        print("Writing images to folder: " + image_folder)

    for ff in images:
        shutil.copy(ff, image_folder)

    # Process the text

    file = open(article)
    lines = file.readlines()
    file.close()

    newFile = open(new_article_path, 'w')

    print("Writing article: " + new_article_path)

    para_line = ""
    list_item_line = ""
    in_code = False
    in_header_id = False
    done_header_id = False
    done_title = False

    for line in lines:

        # Set all images to go in the ./images/ folder
        line = re.sub("\]\((../)+images/", "](./images/", line)

        # Sidebar Fun
        # check if a line has a pipe, then enter our world of pipey wonders
        if re.search("\|",line):

            # strip the whitespace from the beginning and end of all pipetastic lines
            stripped_line = line.strip()

            # if the stripped line starts with | but doesn't end with one, it's a sidebar
            if re.search("^\|",stripped_line) and not re.search("^\|.*\|$",stripped_line):
                # kill the first occurrence of the pipe in a sidebar line
                # preserves indentation
                line = re.sub("\| ","",line,1)

        trimmed_line = line.lstrip()

        if not (done_header_id):

            if not (in_header_id):
                if (trimmed_line.startswith("---")):
                    in_header_id = True
            elif (trimmed_line.startswith("---")):
                    done_header_id = True
                    in_header_id = False
        elif not (done_title):
            if (line.startswith("#")):
                newFile.write(line)
                done_title = True
        elif (trimmed_line.startswith("[TOC")):
            continue
        elif (trimmed_line.startswith("```")):
            # Write the code markup and note whether starting/ending code block
            newFile.write(line)

            if (in_code):
                in_code = False
            else:
                in_code = True
        elif (in_code):
            # Write code line
            newFile.write(line)
        elif (list_item_line != ""):
            if (re.search("^[\d\-]", trimmed_line)):

                # Write the existing list item line
                newFile.write(list_item_line)

                # Set the next list item line as the existing one
                list_item_line = line
            elif (re.search("^[\w\*\@\!\(\&\s\.\[(\`\w)]", trimmed_line)):

                # Append the line content to the existing list item
                list_item_line = list_item_line.rstrip()
                list_item_line = list_item_line.replace("\r","")
                list_item_line = list_item_line.replace("\n","")
                list_item_line = list_item_line + " " + trimmed_line
            else:
                # Write the existing list item and the current line
                newFile.write(list_item_line)
                list_item_line = ""
                newFile.write(line)
        elif (para_line != ""):
            if (re.search("^[\d\-]", trimmed_line)):
                # Write the existing paragraph and start a list item
                list_item_line = line

                newFile.write(para_line)
                para_line = ""
            elif (re.search("^[\w\*\@\!\(\&\.\[\`\s(\w\*\@\!\(\&\.\[\`)]", trimmed_line)):

                # Append the line content to the existing paragraph
                para_line = para_line.rstrip()
                para_line = para_line.replace("\r","")
                para_line = para_line.replace("\n","")
                para_line = para_line + " " + trimmed_line
            elif (re.search("^[\:]", trimmed_line)):

                # Write definition term
                newFile.write(para_line)

                # Start the term definition
                para_line = line
            else:

                # Write the existing paragraph and the current line
                newFile.write(para_line)
                para_line = ""
                newFile.write(line)
        elif (re.search("^[\d\-]", trimmed_line)):

            # Start a list item
            list_item_line = line
        elif (re.search("^[\w\*\@\!\(\&\.\[\`\s\:(\w\*\@\!\(\&\.\[\`)]", trimmed_line)):

            # Start a paragraph
            para_line = line
        else:

            # Write the current line
            newFile.write(line)

    if (para_line != ""):
        newFile.write(para_line)
    elif (list_item_line != ""):
        newFile.write(list_item_line)

    newFile.close()
