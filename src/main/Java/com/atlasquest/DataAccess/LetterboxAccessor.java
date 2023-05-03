package com.atlasquest.DataAccess;

import com.atlasquest.DataObjects.Attribute;
import com.atlasquest.DataObjects.Letterbox;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LetterboxAccessor implements DAO_MySQL<Letterbox> {

    public ArrayList<Letterbox> SelectAllLetterboxes() throws SQLException {
        ArrayList<Letterbox> letterboxes = new ArrayList<Letterbox>();
        try(Connection connection = getConnection()){
            if(connection.isValid(3)){
                CallableStatement procedure = connection.prepareCall("{CALL sp_select_all_letterboxes()}");
                ResultSet resultSet = procedure.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("LetterboxId");
                    String name = resultSet.getString("name");
                    String location = resultSet.getString("location");
                    String owner = resultSet.getString("owner");
                    String findability = resultSet.getString("findability");
                    String status = resultSet.getString("status");
                    Date planted = resultSet.getDate("planted");
                    Date lastFound = resultSet.getDate("lastFound");
                    String clue = resultSet.getString("clue");
                    Letterbox letterbox = new Letterbox(id, name, location, owner, findability, new ArrayList<Attribute>(),
                            status, planted, lastFound, clue);
                    letterboxes.add(letterbox);
                }
                for(Letterbox lb : letterboxes){
                    SelectAttributesByLetterboxId(lb);
                }
            }
        }catch (SQLException e){
            throw e;
        }

        return letterboxes;
    }

    public Letterbox SelectLetterboxeByLetterboxId(int id) throws SQLException {
        Letterbox letterbox = null;
        try(Connection connection = getConnection()){
            if(connection.isValid(3)){
                CallableStatement procedure = connection.prepareCall("{CALL sp_select_letterbox_by_LetterboxId(?)}");
                procedure.setInt(1, id);
                ResultSet resultSet = procedure.executeQuery();
                while (resultSet.next()){
                    String name = resultSet.getString("name");
                    String location = resultSet.getString("location");
                    String owner = resultSet.getString("owner");
                    String findability = resultSet.getString("findability");
                    String status = resultSet.getString("status");
                    Date planted = resultSet.getDate("planted");
                    Date lastFound = resultSet.getDate("lastFound");
                    String clue = resultSet.getString("clue");
                    letterbox = new Letterbox(id, name, location, owner, findability, new ArrayList<Attribute>(),
                            status, planted, lastFound, clue);
                }
                SelectAttributesByLetterboxId(letterbox);

            }
        }catch (SQLException e){
            throw e;
        }

        return letterbox;
    }

    private Letterbox SelectAttributesByLetterboxId(Letterbox letterbox) throws SQLException {

        try(Connection connection = getConnection()){
            if(connection.isValid(3)){
                ArrayList<Attribute> attributes = new ArrayList<Attribute>();
                CallableStatement procedure = connection.prepareCall("{CALL sp_select_attributes_by_LetterboxId(?)}");
                procedure.setInt(1, letterbox.getId());
                ResultSet resultSet = procedure.executeQuery();
                while (resultSet.next()){
                    String attributeId = resultSet.getString(1);
                    String imgURL = resultSet.getString(2);
                    Attribute attribute = new Attribute(attributeId, imgURL);
                    attributes.add(attribute);
                }
                letterbox.setAttributes(attributes);
            }
        }catch (SQLException e){
            throw e;
        }

        return letterbox;
    }

    public int FoundBox(int letterboxId, int userId) throws SQLException{
        int numRowsAffected = 0;
        try(Connection connection = getConnection()) {
            if(connection.isValid(3)) {
                CallableStatement callableStatement = connection.prepareCall("{CALL sp_found_box(?,?)}");
                callableStatement.setInt(1, letterboxId);
                callableStatement.setInt(2, userId);
                numRowsAffected = callableStatement.executeUpdate();
                callableStatement.close();
            }
        } catch(SQLException e) {
            throw e;
        }
        return numRowsAffected;
    }
}
