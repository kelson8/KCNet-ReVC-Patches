# To create patches
* Link to this: https://stackoverflow.com/questions/52884437/git-generate-a-single-patch-across-multiple-commits

(Currently on commit 155, patch number: 155)

1. Run this command in the root of this project: git format-patch -n\<patchnumber\> -o patches
2. Update the patch number in this file, and update the patch number in patches/~patch-number.txt