package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.FileModel;
import util.DBConnection;

public class FileDAO {

    public static boolean saveFile(FileModel file){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO files(filename, original_format, converted_format, file_path) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, file.getFilename());
            ps.setString(2, file.getOriginalFormat());
            ps.setString(3, file.getConvertedFormat());
            ps.setString(4, file.getFilePath());

            ps.executeUpdate();

            status = true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}