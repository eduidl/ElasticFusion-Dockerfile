import argparse
from pathlib import Path

import numpy as np
import open3d as o3d


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--ply', required=True)
    args = parser.parse_args()

    path = Path(args.ply).resolve()
    if not path.exists():
        raise FileNotFoundError(f'{path} does not exist.')

    pcd = o3d.io.read_point_cloud(str(path))
    o3d.visualization.draw_geometries([pcd])


if __name__ == '__main__':
    main()
