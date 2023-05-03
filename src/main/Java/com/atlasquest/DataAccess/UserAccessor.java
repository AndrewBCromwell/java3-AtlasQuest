package com.atlasquest.DataAccess;


import com.atlasquest.DataObjects.Attribute;
import com.atlasquest.DataObjects.Letterbox;
import com.atlasquest.DataObjects.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class UserAccessor implements DAO_MySQL<User>{

    public User SelectUserByTrailNameAndPassword(String trailName, String password) throws SQLException {
        User user = null;
        try(Connection connection = getConnection()){
            if(connection.isValid(3)){
                CallableStatement procedure = connection.prepareCall("{CALL sp_select_user_by_trail_name_and_password(?, ?)}");
                procedure.setString(1, trailName);
                procedure.setString(2, BCrypt.hashpw(password, "$2a$10$rBV2JDeWW3.vKyeQcM8fFO"));
                ResultSet resultSet = procedure.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String email = resultSet.getString("email");
                    int boxesFound = resultSet.getInt("boxes_found");
                    String status = resultSet.getString("status");
                    String privileges = resultSet.getString("privileges");
                    user = new User(id, trailName, firstName, lastName, email, boxesFound, status, privileges);
                }
            }
        }catch (SQLException e){
            throw e;
        }

        return user;
    }

    public int InsertUsers(String trailName, String first_name, String last_name, String email, String password) throws SQLException{
        int numRowsAffected = 0;
        try(Connection connection = getConnection()) {
            if(connection.isValid(3)) {
                CallableStatement callableStatement = connection.prepareCall("{CALL sp_insert_users(?,?,?,?,?)}");
                callableStatement.setString(1, trailName);
                callableStatement.setString(2, first_name);
                callableStatement.setString(3, last_name);
                callableStatement.setString(4, email);
                callableStatement.setString(5, BCrypt.hashpw(password, "$2a$10$rBV2JDeWW3.vKyeQcM8fFO"));
                numRowsAffected = callableStatement.executeUpdate();
                callableStatement.close();
            }
        } catch(SQLException e) {
            throw e;
        }
        return numRowsAffected;

    }

    public int BecomePremium(int userId) throws SQLException{
        int numRowsAffected = 0;
        try(Connection connection = getConnection()) {
            if(connection.isValid(3)) {
                CallableStatement callableStatement = connection.prepareCall("{CALL sp_become_premium(?)}");
                callableStatement.setInt(1, userId);
                numRowsAffected = callableStatement.executeUpdate();
                callableStatement.close();
            }
        } catch(SQLException e) {
            throw e;
        }
        return numRowsAffected;
    }


}
