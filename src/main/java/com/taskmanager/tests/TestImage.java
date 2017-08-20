package com.taskmanager.tests;

import org.omg.CORBA.portable.ApplicationException;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import javax.imageio.ImageIO;

/*
 * @author mkyong
 *
 */
public class TestImage {

    private static final int IMG_WIDTH = 320;
    private static final int IMG_HEIGHT = 200;

    public static void main(String[] args) {

        try {

//            BufferedImage originalImage = ImageIO.read(new File("c:\\image\\1.png"));
            File input = new File("c:\\image\\1.png");


            BufferedImage originalImage = ImageIO.read(input);
            int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

            BufferedImage resizeImagePng = resizeImage(originalImage, type, 500, 300);
            ImageIO.write(resizeImagePng, "png", new File("c:\\image\\mkyong_png.png"));

            byte[] jpgs = resizeImage(resizeImagePng, "jpg");

            scale(jpgs, 150, 100);

            InputStream in = new ByteArrayInputStream(jpgs);
            BufferedImage bImageFromConvert = ImageIO.read(in);

            BufferedImage resizeImage = resizeImage(bImageFromConvert, type, 300, 200);
            ImageIO.write(resizeImage, "png", new File("c:\\image\\Test.png"));


//            ImageIO.write(resizeImageJpg, "jpg", new File("c:\\image\\mkyong_jpg.jpg"));

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }

    public static byte[] scale(byte[] fileData, int width, int height) {
        ByteArrayInputStream in = new ByteArrayInputStream(fileData);
        ByteArrayOutputStream buffer = null;
        try {
            BufferedImage img = ImageIO.read(in);
            if (height == 0) {
                height = (width * img.getHeight()) / img.getWidth();
            }
            if (width == 0) {
                width = (height * img.getWidth()) / img.getHeight();
            }
            Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0, 0, 0), null);

            buffer = new ByteArrayOutputStream();

            ImageIO.write(imageBuff, "jpg", buffer);

        } catch (IOException e) {

        }
        return buffer.toByteArray();
    }


    private static BufferedImage resizeImage(BufferedImage originalImage, int type, int width, int height) {
        BufferedImage resizedImage = new BufferedImage(width, height, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, width, height, null);
        g.dispose();

        return resizedImage;
    }

    public static byte[] resizeImage(BufferedImage originalImage, String type) {
        byte[] imageInByte = null;
        try {
//            BufferedImage originalImage =
//                    ImageIO.read(new File("c:\\image\\mypic.jpg"));

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(originalImage, type, baos);
            baos.flush();
            imageInByte = baos.toByteArray();
            baos.close();

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

        return imageInByte;
    }


    private static BufferedImage resizeImageWithHint(BufferedImage originalImage, int type) {

        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();
        g.setComposite(AlphaComposite.Src);

        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        return resizedImage;
    }
}