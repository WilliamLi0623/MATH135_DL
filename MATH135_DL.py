import wget

url="https://www.math.uwaterloo.ca/~x46wang/MATH135/Lecture"

for i in range(1, 27):
    filename = url+str(i)+".mp4"
    try:
        wget.download(filename)
    except:
        continue