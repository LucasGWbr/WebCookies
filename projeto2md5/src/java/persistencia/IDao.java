package persistencia;


import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author lweber
 */
public interface IDao<T, E> {
    void create(T var1);

    T read(E var1);

    ArrayList<T> readAll();

    void update(T var1);

    void delete(E var1);
}
