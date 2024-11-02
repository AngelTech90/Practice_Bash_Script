# Script for set name images of diferent mokepons:

num_image-1=68;
num_image-2=1;

# This set the type of file for concat the number of names: 
for file in *.png; do
    num=$((num-num_2));
    mv "$file" "mokepon-$num.png";
done