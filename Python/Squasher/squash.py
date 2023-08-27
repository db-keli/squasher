#!usr/bin/env python3
import subprocess
import re
import sys


def add_file_commit(args):
    if any(arg == '-f' for arg in args):
        index = args.index('-f')
        if index + 2 < len(args):
            file_to_add = args[index+1]
            commit_message = args[index+2]
            command = ['git', 'add', file_to_add]
            commit = ['git', 'commit', '-m', commit_message]
            try:
                subprocess.run(command, check=True)
                print(f"Successfully added {file_to_add}")
                subprocess.run(commit, check=True)
                print(f"Commited {file_to_add}")

            except subprocess.CalledProcessError as error:
                print(f"{error}")
    else:
        print("No argument found")


if __name__ == "__main__":
    add_file_commit(sys.argv)
