import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ThifaalKalkulator extends JFrame implements ActionListener {

    private JTextField displayField;
    private JPanel buttonPanel;
    private JButton[] buttons;
    private String[] buttonLabels = {
            "7", "8", "9", "/", 
            "4", "5", "6", "*", 
            "1", "2", "3", "-", 
            "0", ".", "=", "+",
            "C", "√", "^", "%"   
    };
    private String angka1 = "", angka2 = "", operasi = "";
    public ThifaalKalkulator() {
       
        setTitle("ThifaalKalkulator");
        setSize(300, 400);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        displayField = new JTextField();
        displayField.setFont(new Font("arial", Font.PLAIN, 22));
        displayField.setEditable(false);
        displayField.setBackground(Color.white);
        displayField.setHorizontalAlignment(JTextField.RIGHT);
        add(displayField, BorderLayout.NORTH);

        buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(5, 4, 10, 10));  
        buttonPanel.setBackground(Color.blue); 
        buttons = new JButton[20];

        for (int i = 0; i < 20; i++) {
            buttons[i] = new JButton(buttonLabels[i]);
            buttons[i].setFont(new Font("Arial", Font.PLAIN, 24));
            buttons[i].setForeground(Color.black);
            buttons[i].setBackground(new Color(173, 216, 230  ));  
            buttons[i].addActionListener(this);
            buttonPanel.add(buttons[i]);
        }
        add(buttonPanel, BorderLayout.CENTER);
        setPadding(buttonPanel, 20);
        setVisible(true);
    }
    private void setPadding(JPanel panel, int padding) {
        panel.setBorder(BorderFactory.createEmptyBorder(padding, padding, padding, padding));
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        String command = e.getActionCommand();

        if (command.charAt(0) >= '0' && command.charAt(0) <= '9' || command.equals(".")) {
            if (operasi.isEmpty()) {
                angka1 += command;
                displayField.setText(angka1);
            } else {
                angka2 += command;
                displayField.setText(angka2);
            }
        } else if (command.equals("=")) {
            if (!angka1.isEmpty() && !angka2.isEmpty()) {
                double result = Kalkulator(Double.parseDouble(angka1), Double.parseDouble(angka2), operasi);
                displayField.setText(String.valueOf(result));
                angka1 = String.valueOf(result);
                angka2 = "";
                operasi = "";
            }
        } else if (command.equals("C")) {
            
            angka1 = "";
            angka2 = "";
            operasi = "";
            displayField.setText("");
        } else if (command.equals("√")) {
            
            if (!angka1.isEmpty()) {
                double result = Math.sqrt(Double.parseDouble(angka1));
                displayField.setText(String.valueOf(result));
                angka1 = String.valueOf(result);
                angka2 = "";
                operasi = "";
            }
        } else if (command.equals("%")) {
            
            if (!angka1.isEmpty()) {
                double result = Double.parseDouble(angka1) / 100;
                displayField.setText(String.valueOf(result));
                angka1 = String.valueOf(result);
                angka2 = "";
                operasi = "";
            }
        } else if (command.equals("^")) {
            
            operasi = "^";
        } else {
            if (!angka1.isEmpty()) {
                operasi = command;
            }
        }
    }
    private double Kalkulator(double ang1, double ang2, String operasi) {
        switch (operasi) {
            case "+": return ang1 + ang2;
            case "-": return ang1 - ang2;
            case "*": return ang1 * ang2;
            case "/": 
                if (ang2 != 0) return ang1 / ang2;
                else {
                    JOptionPane.showMessageDialog(this, "Tidak Bisa Angka Nol");
                    return 0;
                }
            case "^": return Math.pow(ang1, ang2); 
            default: return 0;
        }
    }
    public static void main(String[] args) {
        new ThifaalKalkulator();
    }
}
