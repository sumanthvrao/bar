import os
import argparse

def main(root_filename):
    with open(os.path.join(root_filename, '.honey1.pdf'), 'wb') as f:
        f.seek(4095)
        f.write(b'\0')

    with open(os.path.join(root_filename, '.honey1.jpg'), 'wb') as f:
        f.seek(4095)
        f.write(b'\0')

    with open(os.path.join(root_filename, '.honey1.txt'), 'wb') as f:
        f.seek(4095)
        f.write(b'\0')

if __name__ == '__main__':

    parser = argparse.Argumentparser()
    parser.add_argument('--root', dest = 'root', default = './root_folder/')
    args = parser.parse_args()

    main(args.root)