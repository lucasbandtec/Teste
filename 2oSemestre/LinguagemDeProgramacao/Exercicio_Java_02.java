/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exercicio_java_01;

import java.util.Scanner;

/**
 *
 * @author Aluno
 */
public class Exercicio_Java_01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int unidade;
        Scanner leitor = new Scanner (System.in);
        System.out.println("Quantas unidades deseja comprar? ");
        unidade = leitor.nextInt();
        int preco;
        System.out.println("Digite o preço de uma unidade: ");
        preco = leitor.nextInt();
        float valor;
        
        valor = unidade * preco;
        System.out.println("O valor de sua compra é " + valor);
    }
    
}
