package persistencia;

import exception.senhaerradaException;
import negocio.Pessoa;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author lweber
 */
public class DAOPessoa implements IDao<Pessoa, String> {

    @Override
    public void create(Pessoa var1) {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql = "INSERT INTO pessoas (nome,senha)VALUES (?, ?);";
        try {
            DataBaseConnectionManager data = new DataBaseConnectionManager(
                    DataBaseConnectionManager.POSTGRESQL, "estudosinde", "postgres", "postgres");
            data.runPreparedSQL(sql, var1.getNome(), var1.getSenha());
            data.closeConnection();
        } catch (DataBaseException ex) {
            System.err.println("Erro ao conectar no banco: " + ex.getMessage());
        }
    }

    @Override
    public Pessoa read(String var1) {
        Pessoa pess = null;
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            DataBaseConnectionManager dbcm = new DataBaseConnectionManager(
                    DataBaseConnectionManager.POSTGRESQL, "estudosinde", "postgres", "postgres");

            String sql = "SELECT * FROM pessoas WHERE id = ?";

            dbcm.runPreparedQuerySQL(sql, var1);

            ResultSet resultado = dbcm.getResultSet();

            if (resultado.isBeforeFirst()) {
                resultado.next();
                int id = resultado.getInt("id");
                String nome = resultado.getString("nome");
                String senha = resultado.getString("senha");

                pess = new Pessoa(nome, senha, id);

            }
            dbcm.closeConnection();

        } catch (DataBaseException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pess;
    }

    @Override
    public ArrayList<Pessoa> readAll() {
        ArrayList<Pessoa> pess = new ArrayList();
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            DataBaseConnectionManager data = new DataBaseConnectionManager(
                    DataBaseConnectionManager.POSTGRESQL, "estudosinde", "postgres", "postgres");
            data.runQuerySQL("SELECT * FROM pessoas ORDER BY id;");
            ResultSet resultBanco = data.getResultSet();

            if (resultBanco.isBeforeFirst()) {
                resultBanco.next();

                while (!resultBanco.isAfterLast()) {
                    int id = resultBanco.getInt("id");
                    String nome = resultBanco.getString("nome");
                    String senha = resultBanco.getString("senha");

                    Pessoa pessoa = new Pessoa(nome, senha, id);
                    pess.add(pessoa);

                    resultBanco.next();
                }
            }
            data.closeConnection();

        } catch (DataBaseException | SQLException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pess;
    }

    @Override
    public void update(Pessoa var1) {
        String sql = "UPDATE pessoas SET nome = ?, senha = ? WHERE id = ?";
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            DataBaseConnectionManager data = new DataBaseConnectionManager(
                    DataBaseConnectionManager.POSTGRESQL, "estudosinde", "postgres", "postgres");
            data.runPreparedSQL(sql, var1.getNome(), var1.getSenha(), var1.getId());
            data.closeConnection();
        } catch (DataBaseException ex) {
            System.out.println("Erro ao conectar no banco");
        }
    }

    @Override
    public void delete(String var1) {
        String sql = "DELETE FROM pessoas WHERE id = ?";
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            DataBaseConnectionManager data = new DataBaseConnectionManager(
                    DataBaseConnectionManager.POSTGRESQL, "estudosinde", "postgres", "postgres");
            data.runPreparedSQL(sql, var1);
            data.closeConnection();
        } catch (DataBaseException ex) {
            System.out.println("Erro ao conectar no banco");
        }
    }

    public boolean verifyUP(Pessoa var1) throws senhaerradaException {
        Pessoa pess = null;
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            DataBaseConnectionManager dbcm = new DataBaseConnectionManager(
                    DataBaseConnectionManager.POSTGRESQL, "estudosinde", "postgres", "postgres");

            String sql = "SELECT * FROM pessoas WHERE LOWER(nome) = LOWER(?)";

            dbcm.runPreparedQuerySQL(sql, var1.getNome());

            ResultSet resultado = dbcm.getResultSet();

            if (resultado.isBeforeFirst()) {
                resultado.next();
                int id = resultado.getInt("id");
                String nome = resultado.getString("nome");
                String senha = resultado.getString("senha");

                pess = new Pessoa(nome, senha, id);

            }
            dbcm.closeConnection();

        } catch (DataBaseException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(DAOPessoa.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (pess != null) {
            if (var1.getNome().equalsIgnoreCase(pess.getNome())) {
                System.out.println(var1.getSenha());
                System.out.println(pess.getSenha());
                if (var1.getSenha().equals(pess.getSenha())) {
                    return true;
                }else{
                    throw new senhaerradaException();
                }
            }
        }
        return false;

    }

}
