import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np

def is_gray(pixel):
    return pixel[0] == pixel[1] == pixel[2]

def find_color(img,i,j):
    best  = img[i][j].copy()
    height = len(img)
    width = len(img[0])
    for d in range(1,10):
        pixels = [(y,x) for y in [i+d,i-d] for x in range(j-d,j+d+1)] + \
                [(y,x) for x in [j+d,j-d] for y in range(i-d, i+d+1)]
        
        for (y,x) in pixels:
            if (0 <= y < height and 0 <= x < width):
                if np.std(img[y][x]) > np.std(best):
                    best = img[y][x].copy()

        if not is_gray(best):
            return best

    return best

def less_gray(img):
    height = len(img)
    width = len(img[0])
    print(width,height)
    for i in range(height):
        for j in range(width):
            if is_gray(img[i][j]):
                new_color = find_color(img,i,j)
                img[i][j] = new_color

    return img

def more_gray(img):
    height = len(img)
    width = len(img[0])
    for i in range(height):
        for j in range(width):
            [red,green,blue] = img[i][j]

            new_color = 4/7*red+2/7*green*1/7*blue

            img[i][j] = [new_color for _ in range(3)]

    return img

def main():
    base = mpimg.imread('img.png')
    color = mpimg.imread('img.png')
    gray = mpimg.imread('img.png')

    gray = more_gray(gray)
    color = less_gray(color)
    
    fig, axs = plt.subplots(1, 3)
    for ax in axs:
        ax.axis('off')
    axs[0].imshow(base)
    axs[1].imshow(color)
    axs[2].imshow(gray)

    plt.show()

if __name__=="__main__":
    main()
