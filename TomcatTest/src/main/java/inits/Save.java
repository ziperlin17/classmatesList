package inits;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import static java.lang.System.out;

public class Save {
    public static void save(String SQLInsert, String fn, String ln, String email, String comment) throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        String url = "jdbc:postgresql://localhost:5432/webappdb";
        String username = "postgres";
        String password = "18pohage";
        Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = conn.prepareStatement(SQLInsert, Statement.RETURN_GENERATED_KEYS)){
            statement.setString(1, fn);
            statement.setString(2, ln);
            statement.setString(3, email);
            statement.setString(4, comment);
            statement.executeUpdate();
        } catch (Exception ex) {
            out.println(ex);
        }
    }
}
