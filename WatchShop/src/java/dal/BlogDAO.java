/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;

/**
 *
 * @author DELL
 */
public class BlogDAO extends BaseDAO{
    public ArrayList<Blog> BlogList() {
        ArrayList<Blog> list=new ArrayList<>();
        
        try {
            String sql = "select * from [blog]  ";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                 list.add(new Blog(rs.getInt(1),
                         rs.getString(2),
                         rs.getString(3),
                         rs.getString(4),
                         rs.getString(5),
                         rs.getDate(6),
                         rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Blog> getBlogsByPaging(int index,int blogsPerPage) {
        ArrayList<Blog> list = new ArrayList<>();

        try {
            String sql = "select * from [blog] order by [blog_id] offset ? rows fetch next ? rows only";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (index - 1) * blogsPerPage);
            statement.setInt(2, blogsPerPage);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Blog getBlogById(String id){
        try {
            String sql = "SELECT [blog_id]\n"
                    + "      ,[title]\n"
                    + "      ,[thumbnail]\n"
                    + "      ,[intro]\n"
                    + "      ,[author]\n"
                    + "      ,[update_time]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  WHERE blog_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                return new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public ArrayList<Blog> searchBlogs(String blogTitle){
        ArrayList<Blog> list = new ArrayList<>();

        try {
            String sql = "select *\n"
                    + "from Blog b\n"
                    + "where b.title like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+blogTitle+"%");

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Blog getLatestBlog(){
        try {
            String sql = "SELECT top 1 *\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  ORDER BY blog_id DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new Blog(rs.getInt(1)
                        , rs.getString(2)
                        ,rs.getString(3)
                        ,rs.getString(4)
                        ,rs.getString(5)
                        ,rs.getDate(6)
                        ,rs.getInt(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertBlog(String blogTitle, String blogThumbnail, String blogIntro, String blogAuthor, String blogStatus){
        String sql = "INSERT INTO [dbo].[Blog]\n"
                + "           ([title]\n"
                + "           ,[thumbnail]\n"
                + "           ,[intro]\n"
                + "           ,[author]\n"
                + "           ,[update_time]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,?)";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blogTitle);
            ps.setString(2, blogThumbnail);
            ps.setString(3, blogIntro);
            ps.setString(4, blogAuthor);
            ps.setString(5, blogStatus);
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editBlogInfo(String blogId, String blogTitle, String blogThumbnail, String blogIntro, String blogAuthor, String blogStatus) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[thumbnail] = ?\n"
                + "      ,[intro] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[update_time] = GETDATE()\n"
                + "      ,[status] = ?\n"
                + " WHERE blog_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blogTitle);
            ps.setString(2, blogThumbnail);
            ps.setString(3, blogIntro);
            ps.setString(4, blogAuthor);
            ps.setString(5, blogStatus);
            ps.setString(6, blogId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editBlogInfoWithoutThumbail(String blogId, String blogTitle, String blogIntro, String blogAuthor, String blogStatus) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[intro] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[update_time] = GETDATE()\n"
                + "      ,[status] = ?\n"
                + " WHERE blog_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blogTitle);
            ps.setString(2, blogIntro);
            ps.setString(3, blogAuthor);
            ps.setString(4, blogStatus);
            ps.setString(5, blogId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteBlog(String blog_id){
        String sql = "DELETE FROM [dbo].[Blog]\n"
                + " WHERE [blog_id] = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blog_id);
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Blog getPostById(String blog_id) {
        String sql = "SELECT * FROM Blog\n"
                + "WHERE blog_id like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blog_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalAccount() {
        String sql = "SELECT COUNT(*) FROM Blog";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public List<Blog> pagingBlog(int index) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog\n"
                + "ORDER BY blog_id\n"
                + "OFFSET ? ROWS FETCH NEXT 2 ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<Blog> searchAuthor(String author) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog\n"
                + "WHERE author like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + author + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7)));
                return list;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        ArrayList<Blog> blogList = dao.BlogList();

        //remove blog with status 0 from list
        int listSizeOld = blogList.size();
        System.out.println(listSizeOld);
        Iterator<Blog> i = blogList.iterator();
        while (i.hasNext()) {
            int status = i.next().getStatus();
            if (status == 0) {
                i.remove();
            }
        }
        int listSize = blogList.size();
        System.out.println(listSize);
    }

}
