/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * LOGIN.java
 *
 * Created on Aug 12, 2017, 11:20:54 PM
 */

package collegeclub;
import javax.swing.JOptionPane;
/**
 *
 * @author HP
 */
public class LOGIN extends javax.swing.JFrame {

    /** Creates new form LOGIN */
    public LOGIN() {
        initComponents();
    }
    int attempts=1;
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jInternalFrame1 = new javax.swing.JInternalFrame();
        jPasswordField1 = new javax.swing.JPasswordField();
        usernamejLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        loginjButton1 = new javax.swing.JButton();
        psswordjLabel2 = new javax.swing.JLabel();
        userjTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jInternalFrame1.setTitle("Login");
        jInternalFrame1.setVisible(true);

        usernamejLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Users-Name-icon (1).png"))); // NOI18N
        usernamejLabel1.setText("Username");

        loginjButton1.setFont(new java.awt.Font("Tahoma", 1, 12));
        loginjButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/sign-check-icon (1).png"))); // NOI18N
        loginjButton1.setText("Login");
        loginjButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                loginjButton1ActionPerformed(evt);
            }
        });

        psswordjLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Security-Password-2-icon.png"))); // NOI18N
        psswordjLabel2.setText("Password");

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 12));
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/reset.png"))); // NOI18N
        jButton1.setText("Reset");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout jInternalFrame1Layout = new org.jdesktop.layout.GroupLayout(jInternalFrame1.getContentPane());
        jInternalFrame1.getContentPane().setLayout(jInternalFrame1Layout);
        jInternalFrame1Layout.setHorizontalGroup(
            jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1Layout.createSequentialGroup()
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(jInternalFrame1Layout.createSequentialGroup()
                                .add(29, 29, 29)
                                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                    .add(org.jdesktop.layout.GroupLayout.TRAILING, psswordjLabel2)
                                    .add(org.jdesktop.layout.GroupLayout.TRAILING, usernamejLabel1))
                                .add(74, 74, 74))
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, jInternalFrame1Layout.createSequentialGroup()
                                .addContainerGap(83, Short.MAX_VALUE)
                                .add(loginjButton1)
                                .add(60, 60, 60)))
                        .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(jButton1)
                            .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                                .add(jPasswordField1)
                                .add(userjTextField1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 165, Short.MAX_VALUE))))
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(70, 70, 70)
                        .add(jLabel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 238, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(68, Short.MAX_VALUE))
        );
        jInternalFrame1Layout.setVerticalGroup(
            jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(userjTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(usernamejLabel1))
                .add(34, 34, 34)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(psswordjLabel2)
                    .add(jPasswordField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(39, 39, 39)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jButton1)
                    .add(loginjButton1))
                .add(45, 45, 45)
                .add(jLabel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 19, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(84, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jInternalFrame1)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                .add(jInternalFrame1)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void loginjButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_loginjButton1ActionPerformed
if(userjTextField1.getText().equals("admin")&&jPasswordField1.getText().equals("admin")){
    jLabel3.setText("Access Granted !! ");
    MenuFrame obj = new MenuFrame();
    obj.setVisible(true);
        }
 else if ( attempts==3&&userjTextField1.getText()!="admin"&&jPasswordField1.getText()!="admin" ){
     jLabel3.setText("Access Denied !!");
     JOptionPane.showMessageDialog(null, "number of attempts exceeded"+attempts);
      System.exit(0);
}else{
    JOptionPane.showMessageDialog(null,"Number of attempts " +attempts);
       attempts++;
             userjTextField1.setText("");
     jPasswordField1.setText("");
}
   
    }//GEN-LAST:event_loginjButton1ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        userjTextField1.setText("");
        jPasswordField1.setText("");
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new LOGIN().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JInternalFrame jInternalFrame1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPasswordField jPasswordField1;
    private javax.swing.JButton loginjButton1;
    private javax.swing.JLabel psswordjLabel2;
    private javax.swing.JTextField userjTextField1;
    private javax.swing.JLabel usernamejLabel1;
    // End of variables declaration//GEN-END:variables

}
