/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author Warspite
 */
public class Base64_image {
    public InputStream decode(String base64Image){
                base64Image = base64Image.replace("data:image/jpeg;base64,", "");
                byte[] imageBytes = Base64.decodeBase64(base64Image);
                ByteArrayInputStream defaultAvatar = new ByteArrayInputStream(imageBytes);

                return defaultAvatar;
    }
    
    public String encode(Blob image){
        try{
            // process avatar
        InputStream imageInputStream = image.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = imageInputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = outputStream.toByteArray();
        //
        // convert image to base64
        String imageBase64 = Base64.encodeBase64String(imageBytes);
                return "data:image/jpeg;base64,"+imageBase64;
        }catch(Exception e){
            e.printStackTrace();
        }
                return "";
        
    }
}
