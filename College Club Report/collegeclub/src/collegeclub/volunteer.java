/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * volunteer.java
 *
 * Created on Aug 3, 2017, 2:52:52 PM
 */

package collegeclub;
import java.sql.*;

/**
 *
 * @author HP
 */
public class volunteer extends javax.swing.JFrame {
ConnectionClass cobj;
PreparedStatement pst;
ResultSet rst;
long vid;
long cid[];
long mid[];
boolean flag;

    /** Creates new form volunteer */
    public volunteer() {
        initComponents();
cobj=new ConnectionClass();
cobj.Connect();
cid=new long[100];
int index=0;
flag=false;
try{
    pst=cobj.con.prepareStatement("select Clubid, clubname from tbclub");
    rst=pst.executeQuery();
    while(rst.next())
    {
        cid[index]=rst.getLong(1);
        index++;
        clubidjComboBox1.addItem(rst.getString(2));
    }
         rst.close();

        }
        catch(Exception ex)
        {
        System.out.print("error in inpopulating clubid"+ex);
        }
        cobj.DisConnect();
        flag=true;
    }

    

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jInternalFrame1 = new javax.swing.JInternalFrame();
        clubidjComboBox1 = new javax.swing.JComboBox();
        searchjButton2 = new javax.swing.JButton();
        updatejButton3 = new javax.swing.JButton();
        designationjLabel4 = new javax.swing.JLabel();
        membershipidjComboBox2 = new javax.swing.JComboBox();
        resetjButton4 = new javax.swing.JButton();
        membershipidjLabel3 = new javax.swing.JLabel();
        designationjTextField2 = new javax.swing.JTextField();
        eventidjLabel2 = new javax.swing.JLabel();
        savejButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jInternalFrame1.setTitle("Volunteer");
        jInternalFrame1.setVisible(true);

        clubidjComboBox1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                clubidjComboBox1ItemStateChanged(evt);
            }
        });
        clubidjComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                clubidjComboBox1ActionPerformed(evt);
            }
        });

        searchjButton2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        searchjButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Search-icon.png"))); // NOI18N
        searchjButton2.setText("Search");
        searchjButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchjButton2ActionPerformed(evt);
            }
        });

        updatejButton3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        updatejButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/update.png"))); // NOI18N
        updatejButton3.setText("Update");
        updatejButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updatejButton3ActionPerformed(evt);
            }
        });

        designationjLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Teacher-icon.png"))); // NOI18N
        designationjLabel4.setText("Designation");

        resetjButton4.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        resetjButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/reset.png"))); // NOI18N
        resetjButton4.setText("Reset");
        resetjButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                resetjButton4ActionPerformed(evt);
            }
        });

        membershipidjLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Users-Name-icon (1).png"))); // NOI18N
        membershipidjLabel3.setText("Select Member");

        eventidjLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Cursor-icon (1).png"))); // NOI18N
        eventidjLabel2.setText("Select Club");

        savejButton1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        savejButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/collegeclub/resources/Apps-File-Save-B-icon.png"))); // NOI18N
        savejButton1.setText("Save");
        savejButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                savejButton1ActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout jInternalFrame1Layout = new org.jdesktop.layout.GroupLayout(jInternalFrame1.getContentPane());
        jInternalFrame1.getContentPane().setLayout(jInternalFrame1Layout);
        jInternalFrame1Layout.setHorizontalGroup(
            jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1Layout.createSequentialGroup()
                .add(44, 44, 44)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(membershipidjLabel3)
                    .add(eventidjLabel2)
                    .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                        .add(savejButton1)
                        .add(designationjLabel4)))
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(22, 22, 22)
                        .add(searchjButton2)
                        .add(18, 18, 18)
                        .add(updatejButton3)
                        .add(26, 26, 26)
                        .add(resetjButton4))
                    .add(jInternalFrame1Layout.createSequentialGroup()
                        .add(73, 73, 73)
                        .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                            .add(org.jdesktop.layout.GroupLayout.LEADING, clubidjComboBox1, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .add(org.jdesktop.layout.GroupLayout.LEADING, membershipidjComboBox2, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .add(org.jdesktop.layout.GroupLayout.LEADING, designationjTextField2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 256, Short.MAX_VALUE))))
                .addContainerGap(34, Short.MAX_VALUE))
        );
        jInternalFrame1Layout.setVerticalGroup(
            jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(eventidjLabel2)
                    .add(clubidjComboBox1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(membershipidjLabel3)
                    .add(membershipidjComboBox2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(designationjLabel4)
                    .add(designationjTextField2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(56, 56, 56)
                .add(jInternalFrame1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(searchjButton2)
                    .add(updatejButton3)
                    .add(resetjButton4)
                    .add(savejButton1))
                .addContainerGap(176, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jInternalFrame1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jInternalFrame1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void clubidjComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_clubidjComboBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_clubidjComboBox1ActionPerformed

    private void clubidjComboBox1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_clubidjComboBox1ItemStateChanged
       if(flag==true)
       {
           membershipidjComboBox2.removeAllItems();
           cobj.Connect();
           mid=new long[100];
           int index=0;
           try{
               pst=cobj.con.prepareStatement("select [membership id], member_name from tbmembership where clubid=?");
               pst.setLong(1,cid[clubidjComboBox1.getSelectedIndex()]);
               rst=pst.executeQuery();
               while(rst.next())
               {
                   mid[index]=rst.getLong(1);
                   index++;
                   membershipidjComboBox2.addItem(rst.getString(2).trim());
               }
               rst.close();
           }

           catch(Exception ex)
           {
           System.out.print("Error in populating member"+ex);
           }
                      cobj.DisConnect();
        }



    }//GEN-LAST:event_clubidjComboBox1ItemStateChanged

    private void savejButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_savejButton1ActionPerformed





            cobj.Connect();
            try
            {
                pst=cobj.con.prepareCall("{call prcInsertVolunteer(?,?,?)} ");
                        pst.setLong(1,cid[clubidjComboBox1.getSelectedIndex()]);
                        pst.setLong(2,mid[membershipidjComboBox2.getSelectedIndex()]);
                        pst.setString(3,designationjTextField2.getText());
                        

                      if(pst.execute()==false)
                      {
                          if(pst.getUpdateCount()>0)
                          {
                              System.out.print("Record saved");
                              clubidjComboBox1.setSelectedIndex(0);
                              membershipidjComboBox2.setSelectedIndex(0);
                              designationjTextField2.setText("");
                              

                          }
 else
                          {
                              System.out.println("Record already exists");
 }
                }
            }
            catch(Exception ex)
            {
                System.out.println("error in insert"+ex);
            }
            cobj.DisConnect();
    }//GEN-LAST:event_savejButton1ActionPerformed

    private void searchjButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchjButton2ActionPerformed
          cobj.Connect();
            try

            {
                pst=cobj.con.prepareStatement("Select * from tbvolunteer where designation=?");
                pst.setString(1,designationjTextField2.getText());
                rst=pst.executeQuery();
                if(rst.next())
                {
                    vid=rst.getLong(1);
                    clubidjComboBox1.setSelectedIndex(new searcharray().find(cid,rst.getLong(2)));
   membershipidjComboBox2.setSelectedIndex(new searcharray().find(mid,rst.getLong(3)));
designationjTextField2 .setText(rst.getString(4).trim());

                }

 else
                {
                    System.out.println("record not found");
                }
 }

 catch(Exception ex)
            {
     System.out.println("error in search"+ex);
                                                                                        
            }
 cobj.DisConnect();

    }//GEN-LAST:event_searchjButton2ActionPerformed

    private void updatejButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updatejButton3ActionPerformed
        cobj.Connect();
try
{
    pst=cobj.con.prepareCall("{call prcUpdateVolunteer(?,?,?,?)}");
pst.setLong(1,vid);
pst.setLong(2,cid[clubidjComboBox1.getSelectedIndex()]);
pst.setLong(3,mid[membershipidjComboBox2.getSelectedIndex()]);
pst.setString(4,designationjTextField2.getText());


if(pst.execute()==false)
{
    if(pst.getUpdateCount()>0)
    {
        System.out.println("Record Updated");
        clubidjComboBox1.setSelectedIndex(0);
      membershipidjComboBox2 .setSelectedIndex(0);
     designationjTextField2.setText("");
  
    }
 else{
        System.out.println("Record not updated");
 }
}
        }
catch(Exception ex)
{
    System.out.println("Error in Update"+ex);
}
cobj.DisConnect();
    }//GEN-LAST:event_updatejButton3ActionPerformed

    private void resetjButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_resetjButton4ActionPerformed
     clubidjComboBox1.setSelectedIndex(0);
      membershipidjComboBox2 .setSelectedIndex(0);
     designationjTextField2.setText("");
    }//GEN-LAST:event_resetjButton4ActionPerformed

    /**
    * @param args the command line arguments        
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new volunteer().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox clubidjComboBox1;
    private javax.swing.JLabel designationjLabel4;
    private javax.swing.JTextField designationjTextField2;
    private javax.swing.JLabel eventidjLabel2;
    private javax.swing.JInternalFrame jInternalFrame1;
    private javax.swing.JComboBox membershipidjComboBox2;
    private javax.swing.JLabel membershipidjLabel3;
    private javax.swing.JButton resetjButton4;
    private javax.swing.JButton savejButton1;
    private javax.swing.JButton searchjButton2;
    private javax.swing.JButton updatejButton3;
    // End of variables declaration//GEN-END:variables

}
