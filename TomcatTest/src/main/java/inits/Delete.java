package inits;

import java.lang.reflect.InvocationTargetException;
import java.sql.*;

import static java.lang.System.out;

public class Delete {
    public static void delete(String SQLInsert) throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException, SQLException {
        String url = "jdbc:postgresql://localhost:5432/webappdb";
        String username = "postgres";
        String password = "18pohage";
        Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = conn.prepareStatement(SQLInsert)) {
            statement.executeUpdate();
            int affectedRows = statement.executeUpdate();
            if (affectedRows != 1) {
            throw new SQLException("No user with current ID"); }
        } catch (Exception ex) {
            out.println(ex);
        }
    }
}
