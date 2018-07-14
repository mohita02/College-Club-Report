/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * club.java
 *
 * Created on Aug 1, 2017, 3:15:30 PM
 */

package collegeclub;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author HP
 */
public class club extends javax.swing.JFrame {

ConnectionClass cobj;
    PreparedStatement pst;
    ResultSet rst;
    Long clubid;
DefaultTableModel model;
JTable table;
JScrollPane js;

    /** Creates new form club */
    public club() {
        initComponents();
        cobj=new ConnectionClass();
        model = new DefaultTableModel();
    table = new JTable(model);
js = new JScrollPane(table);
model.addColumn("Club ID");
model.addColumn("Club Name");
model.addColumn("Start Date");
model.addColumn("Student Incharge");
model.addColumn("Contact Number");
model.addColumn("Email");
model.addColumn("Teacher Incharge");
model.addColumn("Membership Fee");

js.setBounds(700,50,500,400);
add(js);
cobj.Connect();
try
{
pst=cobj.con.prepareStatement("select * from tbClub");
rst=pst.executeQuery();
while(rst.next())
{
model.insertRow(model.getRowCount(), new Object[] { rst.getString(1),rst.getString(2),rst.getString(3),rst.getString(4),rst.getString(5),rst.getString(6),rst.getString(7),rst.getString(8)});
}
rst.close();
}
catch(Exception e)
{
    System.out.println("error "+ e.getMessage());
}
cobj.DisConnect();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jInternalFrame1 = new javax.swing.JInternalFrame();
        jlabel2 = new javax.swing.JLabel();
        updatejButton = new javax.swing.JButton();
        jTextField5 = new javax.swing.JTextField();
        savejButton = new javax.swing.JButton();
        jLabel6 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jTextField3 = new javax.swing.JTextField();
        jTextField6 = new javax.swing.JTextField();
        jTextField8 = new javax.swing.JTextField();
        searchjButton = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        resetjbutton = new javax.swing.JButton();
        jTextField7 = new javax.swing.JTextField();

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        jInternalFrame1.setTitle("Club");
        jInternalFrame1.setVisible(true);

        jlabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Bowling-icon.png"))); // NOI18N
        jlabel2.setText("Club name");

        updatejButton.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        updatejButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/update.png"))); // NOI18N
        updatejButton.setText("Update");
        updatejButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updatejButtonActionPerformed(evt);
            }
        });

        savejButton.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        savejButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Apps-File-Save-B-icon.png"))); // NOI18N
        savejButton.setText("Save");
        savejButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                savejButtonActionPerformed(evt);
            }
        });

        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Mail-icon.png"))); // NOI18N
        jLabel6.setText("Email");

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/money-icon.png"))); // NOI18N
        jLabel8.setText("Membership fee");

        jTextField3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField3ActionPerformed(evt);
            }
        });

        jTextField8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField8ActionPerformed(evt);
            }
        });

        searchjButton.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        searchjButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Search-icon.png"))); // NOI18N
        searchjButton.setText("Search");
        searchjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchjButtonActionPerformed(evt);
            }
        });

        jLabel5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Phone-icon.png"))); // NOI18N
        jLabel5.setText("Contact number");

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Calendar-icon.png"))); // NOI18N
        jLabel3.setText("Start date");

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Student-3-icon.png"))); // NOI18N
        jLabel4.setText("Student incharge");

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Teacher-icon.png"))); // NOI18N
        jLabel7.setText("Teacher incharge");

        resetjbutton.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        resetjbutton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/reset.png"))); // NOI18N
        resetjbutton.setText("Reset");
        resetjbutton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                resetjbuttonActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout jInternalFrame1Layout = new org.jdesktop.layout.GroupLayout(jInternalFrame1.getContentPane());
        jInternalFrame1.getContentPane().setLayout(jInternalFrame1Layout);
        jInternalFrame1Layout.setHorizontalGroup(
            jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1Layout.createSequentialGroup()
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .addContainerGap()
                        .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(jLabel4)
                            .add(jInternalFrame1Layout.createSequentialGroup()
                                .add(1, 1, 1)
                                .add(jLabel3))
                            .add(jLabel5)
                            .add(jLabel6)
                            .add(jLabel7)
                            .add(jLabel8)
                            .add(savejButton)))
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(19, 19, 19)
                        .add(jlabel2)))
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(23, 23, 23)
                        .add(searchjButton)
                        .add(44, 44, 44)
                        .add(updatejButton)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 42, Short.MAX_VALUE)
                        .add(resetjbutton)
                        .add(13, 13, 13))
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(148, 148, 148)
                        .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(jTextField4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                            .add(jTextField5, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                            .add(jTextField6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                            .add(jTextField7, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                            .add(jTextField8, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                            .add(jTextField3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE)
                            .add(jTextField2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 291, Short.MAX_VALUE))))
                .add(51, 51, 51))
        );
        jInternalFrame1Layout.setVerticalGroup(
            jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jTextField2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jlabel2))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel3)
                    .add(jTextField3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel4)
                    .add(jTextField4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel5)
                    .add(jTextField5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel6)
                    .add(jTextField6, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel7)
                    .add(jTextField7, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel8)
                    .add(jTextField8, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(28, 28, 28)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(savejButton)
                    .add(searchjButton)
                    .add(updatejButton)
                    .add(resetjbutton))
                .addContainerGap(151, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jInternalFrame1)
                .add(673, 673, 673))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jInternalFrame1)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTextField3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField3ActionPerformed

    private void jTextField8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField8ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField8ActionPerformed

    private void savejButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_savejButtonActionPerformed
      cobj.Connect();
        try{
  pst=cobj.con.prepareCall("{call prcinsertclub(?,?,?,?,?,?,?)}");
                pst.setString(1,jTextField2.getText());
       pst.setString(2,jTextField3.getText());
        pst.setString(3,jTextField4.getText());
         pst.setString(4,jTextField5.getText());
     pst.setString(5,jTextField6.getText());
          pst.setString(6,jTextField7.getText());
          pst.setString(7,jTextField8.getText());
         if(pst.execute()==false)
         {
             if(pst.getUpdateCount()>0)
             {
                 System.out.print("Record Saved");
                 jTextField2.setText("");
                 jTextField3.setText("");
                 jTextField4.setText("");
                 jTextField5.setText("");
                 jTextField6.setText("");
                  jTextField7.setText("");
                  jTextField8.setText("");
             }
             }
            }
        catch(Exception ex)
        {
            System.out.print("error in insert"+ex);
        }
        cobj.DisConnect();
    
    }//GEN-LAST:event_savejButtonActionPerformed

private void searchjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchjButtonActionPerformed
    cobj.Connect();
    try
    {

        pst=cobj.con.prepareStatement("Select * from tbclub where clubname=?");
        pst.setString(1,jTextField2.getText());
        rst=pst.executeQuery();
        if(rst.next())
            {
             clubid=rst.getLong(1);
            jTextField2.setText(rst.getString(2).trim());
            jTextField3.setText(rst.getString(3).trim());
            jTextField4.setText(rst.getString(4).trim());
           jTextField5.setText(rst.getString(5).trim());
           jTextField6.setText(rst.getString(6).trim());
           jTextField7.setText(rst.getString(7).trim());
          jTextField8.setText(rst.getString(8).trim());


}
        else
            {
            System.out.print("search not found");
        }
        }
    catch(Exception ex)
            {
        System.out.print("Error in search"+ex);


}
            cobj.DisConnect();

}//GEN-LAST:event_searchjButtonActionPerformed

private void updatejButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updatejButtonActionPerformed
    cobj.Connect();
    try
            {

                pst=cobj.con.prepareCall("{call prcUpdateclub(?,?,?,?,?,?,?,?)}");
 
      pst.setLong(1,clubid);
      pst.setString(2,jTextField2.getText());
      pst.setString(3,jTextField3.getText());
      pst.setString(4,jTextField4.getText());
      pst.setString(5,jTextField5.getText());
      pst.setString(6,jTextField6.getText());
      pst.setString(7,jTextField7.getText());
      pst.setString(8,jTextField8.getText());
      if (pst.execute()==false)
                {
          if(pst.getUpdateCount()>0)
              System.out.print("Record Updated");
          jTextField2.setText("");
           jTextField3.setText("");
            jTextField4.setText("");
             jTextField5.setText("");
              jTextField6.setText("");
               jTextField7.setText("");
               jTextField8.setText("");
      }
                }
    catch(Exception ex)
    {
        System.out.print("Error in update"+ex);

    }
    cobj.DisConnect();
}//GEN-LAST:event_updatejButtonActionPerformed

private void resetjbuttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_resetjbuttonActionPerformed
   jTextField2.setText("");
   jTextField3.setText("");
   jTextField4.setText("");
   jTextField5.setText("");
   jTextField6.setText("");
   jTextField7.setText("");
   jTextField8.setText("");
}//GEN-LAST:event_resetjbuttonActionPerformed

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new club().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JInternalFrame jInternalFrame1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    private javax.swing.JTextField jTextField7;
    private javax.swing.JTextField jTextField8;
    private javax.swing.JLabel jlabel2;
    private javax.swing.JButton resetjbutton;
    private javax.swing.JButton savejButton;
    private javax.swing.JButton searchjButton;
    private javax.swing.JButton updatejButton;
    // End of variables declaration//GEN-END:variables

}
