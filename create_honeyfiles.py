import os
import argparse

def main(root_filename):
    if not root_filename[-1] == '/':
        root_filename = root_filename + '/'
    
    with open(os.path.join(root_filename, '.honey1.pdf'), 'wb') as f:
        f.seek(10485759)
        f.write(b'\0')

if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('--root', dest = 'root', default = './root_folder/')
    args = parser.parse_args()

    main(args.root)