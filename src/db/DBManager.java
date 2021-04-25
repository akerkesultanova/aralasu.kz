package db;

import java.net.UnknownServiceException;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/week5?useUnicode=true&serverTimezone=UTC", "root", "root");
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
    }

    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from users ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                users.add(new User(
                        resultSet.getLong("id"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name"),
                        resultSet.getString("birth_date"),
                        resultSet.getString("picture_url")
                ));
            }
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return users;
    }


    public static ArrayList<Post> getAllPosts(){
        ArrayList<Post> posts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select p.id,p.author_id,u.email,u.password,u.full_name,u.birth_date,u.picture_url,p.title,p.short_content,p.content,p.post_date from posts p, users u where p.author_id=u.id order by p.post_date desc ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                posts.add(new Post(
                        resultSet.getLong("id"),
                        new User(
                                resultSet.getLong("author_id"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                resultSet.getString("full_name"),
                                resultSet.getString("birth_date"),
                                resultSet.getString("picture_url")
                        ),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getString("post_date")
                ));
            }
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return posts;
    }


    public static ArrayList<Post> getAllPosts(Long id){
        ArrayList<Post> posts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from posts p, users u where p.author_id = u.id and u.id = ? order by p.post_date desc ");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                posts.add(new Post(
                        resultSet.getLong("id"),
                        new User(
                                resultSet.getLong("author_id"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                resultSet.getString("full_name"),
                                resultSet.getString("birth_date"),
                                resultSet.getString("picture_url")
                        ),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getString("post_date")
                ));
            }
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return posts;
    }


    public static User getUser(String email){
        User user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from users where email = ? ");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                user = new User(
                        resultSet.getLong("id"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("full_name"),
                        resultSet.getString("birth_date"),
                        resultSet.getString("picture_url")
                );
            }
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return user;
    }


    public static Post getPost(Long id){
        Post post = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select p.id,p.author_id,u.email,u.password,u.full_name,u.birth_date,u.picture_url,p.title,p.short_content,p.content,p.post_date " +
                    "from posts p,users u " +
                    "where p.author_id=u.id and p.id = ? ");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                post = new Post(
                        resultSet.getLong("id"),
                        new User(
                                resultSet.getLong("author_id"),
                                resultSet.getString("email"),
                                resultSet.getString("password"),
                                resultSet.getString("full_name"),
                                resultSet.getString("birth_date"),
                                resultSet.getString("picture_url")
                        ),
                        resultSet.getString("title"),
                        resultSet.getString("short_content"),
                        resultSet.getString("content"),
                        resultSet.getString("post_date")
                );
            }
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return post;
    }


    public static boolean deletePost(Long id){
        int row = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("delete from posts where id = ? ");
            statement.setLong(1,id);
            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }


    public static boolean addUser(User user){
        int row = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("insert into users (email, password, full_name, birth_date, picture_url) values(?,?,?,?,?) ");
            statement.setString(1,user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3,user.getFull_name());
            statement.setString(4,user.getBirth_date());
            statement.setString(5,user.getPicture_url());

            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }


    public static boolean addPost(Post post){
        int row = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("insert into posts (id, author_id, title, short_content, content, post_date) values(null,?,?,?,?,?) ");
            statement.setLong(1,post.getAuthor_id().getId());
            statement.setString(2,post.getTitle());
            statement.setString(3,post.getShort_content());
            statement.setString(4,post.getContent());
            statement.setString(5,post.getPost_date());

            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }


    public static boolean updatePost(Post post){
        int row = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("update posts set author_id=?,title=?,short_content=?,content=?,post_date=? where id = ? ");
            statement.setLong(1,post.getAuthor_id().getId());
            statement.setString(2,post.getTitle());
            statement.setString(3,post.getShort_content());
            statement.setString(4,post.getContent());
            statement.setTimestamp(5, Timestamp.valueOf(post.getPost_date()));
            statement.setLong(6,post.getId());

            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }


    public static boolean updateProfile(User user){
        int row = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("update users set full_name = ?, birth_date = ? where email = ? ");
            statement.setString(1,user.getFull_name());
            statement.setString(2,user.getBirth_date());
            statement.setString(3,user.getEmail());
            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }


    public static boolean updatePicture(User user){
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("update users set picture_url = ? where email = ? ");
            statement.setString(1,user.getPicture_url());
            statement.setString(2,user.getEmail());
            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }


    public static boolean updatePassword(User user){
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("update users set password=? where email=? ");
            statement.setString(1,user.getPassword());
            statement.setString(2,user.getEmail());
            row = statement.executeUpdate();
            statement.close();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return row>0;
    }
}
