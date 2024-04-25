
package utility;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.UUID;

/**
 *
 * @author datng
 */
public class uploadImage {
    public String uploadImagePath(Part filePart, String folder) throws IOException{
        
        // Tạo một tên tệp tin duy nhất bằng UUID
        String fileName = UUID.randomUUID().toString() + "-" + filePart.getSubmittedFileName();
        
        // Thay đổi đường dẫn lưu trữ tùy thuộc vào môi trường của bạn
        String uploadDirectory = "D:/SWP391/g5/WatchShop/web/img/" + folder +"/";
        
        // Lưu trữ tệp tin đã tải lên
        filePart.write(uploadDirectory + fileName);
        
        // Tạo đường dẫn đầy đủ của tệp tin đã tải lên
        String uploadedImagePath = "img/" + folder +"/" + fileName;       
        return uploadedImagePath;
    }
}
