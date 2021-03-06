/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * participantReprt.java
 *
 * Created on Aug 14, 2017, 5:36:17 PM
 */

package collegeclub;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.table.DefaultTableModel;
import java.sql.*;
/**
 *
 * @author HP
 */
public class participantReprt extends javax.swing.JFrame {
    DefaultTableModel model;
JTable table;
JScrollPane js;
PreparedStatement pst;
ResultSet rst;
ConnectionClass cobj;

    /** Creates new form participantReprt */
    public participantReprt() {
        initComponents();
        cobj = new ConnectionClass();
         model = new DefaultTableModel();
    table = new JTable(model);
js = new JScrollPane(table);

model.addColumn("Event Name");
model.addColumn("Participant name");
model.addColumn("Fathers Name");
model.addColumn("Roll Number");
model.addColumn("Course Name");
model.addColumn("Year/Semester");
model.addColumn("E-Mail");
model.addColumn("Contact Number");
model.addColumn("Enrollment Date");
model.addColumn("Paid amount");
model.addColumn("Pending amount");
model.addColumn("Result");
js.setBounds(60,100,650,300);
add(js);}

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Time-Date-From-icon.png"))); // NOI18N
        jLabel1.setText("From Date");

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Time-And-Date-Today-icon.png"))); // NOI18N
        jLabel2.setText("To Date");

        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Search-Results-icon.png"))); // NOI18N
        jButton1.setText("Show");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(40, 40, 40)
                .add(jLabel1)
                .add(18, 18, 18)
                .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 77, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(45, 45, 45)
                .add(jLabel2)
                .add(29, 29, 29)
                .add(jTextField2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 87, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(91, 91, 91)
                .add(jButton1)
                .addContainerGap(100, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(47, 47, 47)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jTextField2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jLabel2)
                    .add(jLabel1)
                    .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jButton1))
                .addContainerGap(393, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
       cobj.Connect();

        if(jTextField1.getText().equals(""))
System.out.println("Enter from date");
else
if(jTextField2.getText().equals(""))
System.out.println("Enter to date");
else
{
int count=model.getRowCount();
for(int index=count-1;index>=0;index--)
{
model.removeRow(index);
}
try
{
pst=cobj.con.prepareStatement("select (Select name from tbevent a where b.eventid=a.eventid ) as Event_Name ,* from tbparticipant b where [enrollment date]>=? and[enrollment date]<=?");
pst.setString(1, jTextField1.getText());
pst.setString(2, jTextField2.getText());
rst=pst.executeQuery();
while(rst.next())
{
model.insertRow(model.getRowCount(), new Object[] {rst.getString(1),rst.getString(4),rst.getString(5),rst.getString(6),rst.getString(7),rst.getString(8),rst.getString(9),rst.getString(10),rst.getString(11),rst.getString(12),rst.getString(13),rst.getString(14)});
}
rst.close();
}
catch(Exception e)
{System.out.println("error "+ e.getMessage());
}
}
cobj.DisConnect();
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new participantReprt().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    // End of variables declaration//GEN-END:variables

}
