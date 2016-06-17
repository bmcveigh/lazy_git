#################################################################
# This script is useful for if you want to commit some files in #
# git or merge them into the master branch but you are too lazy #
# or too tired to enter in so many git commands.                #
#################################################################
# 																#
# @author Brian McVeigh											#
# @date June 17, 2016	   										#
#                                         						#
#################################################################

read -e -p "Should we merge to the master branch (y/n)?" merge_to_master
git status
read -e -p "Enter path to commit: " path
read -e -p "Enter commit message: " commit_message

if [ $path == "a" ] || [ path == "all" ]
then
	git add --all
elif [ $path == "quit" ] || [ $path == "q"]
then
	echo "Goodbye"
	exit
else
	git add "$path"
fi

git commit -m "$commit_message"

git push origin develop

if [ $merge_to_master == "y" ]
then
	git checkout master
	git merge develop
	git push origin master
	git checkout develop
fi
