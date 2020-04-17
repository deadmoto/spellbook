#### Resize image to specific width
`convert -resize 800 input.png output.png`

#### Add padding
`convert in.png -size 1920x1080 xc:white +swap -gravity center -composite out.png`
or
`ls *.png | xargs -L 1 -I {} convert {} -size 1920x1080 xc:white +swap -gravity center -composite out/{}`
