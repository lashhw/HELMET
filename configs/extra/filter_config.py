import yaml
import argparse

parser = argparse.ArgumentParser()

parser.add_argument(
    '-i',
    type=str,
    required=True,
)
parser.add_argument(
    '-o',
    type=str,
    required=True,
)
parser.add_argument(
    '-x',
    type=int,
    nargs='+',
    required=True,
)

args = parser.parse_args()

list_keys = [
    'input_max_length',
    'datasets',
    'generation_max_length',
    'test_files',
    'demo_files'
]

with open(args.i) as f:
    data = yaml.safe_load(f)

new_data = {}

for key, value in data.items():
    if key in list_keys:
        items = value.split(',')
        filtered_items = [items[i] for i in args.x]
        new_data[key] = ','.join(filtered_items)
    else:
        new_data[key] = value

with open(args.o, 'w') as f:
    yaml.dump(new_data, f, sort_keys=False)