import os
rootdir = 'pictures'
def main():
	arr = get_images()
	print arr
	


def get_images():
	arr = []
	for subdir, dirs, files in os.walk(rootdir):
	    for file in files:
	        arr.append(os.path.join(subdir, file))
	return arr


if __name__ == '__main__':
	main()