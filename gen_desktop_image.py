import PIL
import PIL.Image
import PIL.ImageFont
import PIL.ImageOps
import PIL.ImageDraw

PIXEL_ON = 255  # PIL color to use for "on"
PIXEL_OFF = 0  # PIL color to use for "off"
INIT_READING = "### Init Read for Desktop Image ###"
END_READING = "### End Read for Desktop Image ###"
CHANGE_STRING_LIST = [("bindsym ", ""), ("$mod", "Win"), (" exec ", " => ")]

def main():
    image = text_image('/home/tiwork/.config/i3/config', '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf')
    image.save('/home/tiwork/.config/i3/desktop.png')

def command_filter(line):
    for item in CHANGE_STRING_LIST:
        line = line.replace(item[0], item[1])
    return line

def get_eligible_lines(arr):
    is_reading = False
    lines_list = []
    print("Lines length: ")
    print(len(arr))
    for line in arr:
        if line.rstrip() == INIT_READING:
            is_reading = True
        elif line.rstrip() == END_READING:
            is_reading = False
        elif is_reading == True:
            lines_list.append(command_filter(line))
    return lines_list

def text_image(text_path, font_path=None):
    """Convert text file to a grayscale image with black characters on a white background.

    arguments:
    text_path - the content of this file will be converted to an image
    font_path - path to a font file (for example impact.ttf)
    """
    grayscale = 'L'
    # parse the file into lines
    print("The path: " + text_path)
    with open(text_path) as text_file:  # can throw FileNotFoundError
        lines = tuple(l.rstrip() for l in get_eligible_lines(text_file.readlines()))

    # choose a font (you can see more detail in my library on github)
    large_font = 20  # get better resolution with larger size
    font_path = font_path or 'cour.ttf'  # Courier New. works in windows. linux may need more explicit path
    try:
        font = PIL.ImageFont.truetype(font_path, size=large_font)
    except IOError:
        font = PIL.ImageFont.load_default()
        print('Could not use chosen font. Using default.')

    # make the background image based on the combination of font and lines
    pt2px = lambda pt: int(round(pt * 96.0 / 72))  # convert points to pixels
    max_width_line = max(lines, key=lambda s: font.getsize(s)[0])
    # max height is adjusted down because it's too large visually for spacing
    test_string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    max_height = pt2px(font.getsize(test_string)[1])
    max_width = pt2px(font.getsize(max_width_line)[0])
    height = max_height * len(lines)  # perfect or a little oversized
    width = int(round(max_width))  # a little oversized
    image = PIL.Image.new(grayscale, (width, height), color=PIXEL_OFF)
    draw = PIL.ImageDraw.Draw(image)

    # draw each line of text
    vertical_position = 5
    horizontal_position = 5
    line_spacing = int(round(max_height * 0.8))  # reduced spacing seems better
    for line in lines:
        draw.text((horizontal_position, vertical_position),
                  line, fill=PIXEL_ON, font=font)
        vertical_position += line_spacing
    # crop the text
    c_box = PIL.ImageOps.invert(image).getbbox()
    image = image.crop(c_box)
    return image


if __name__ == '__main__':
    main()
