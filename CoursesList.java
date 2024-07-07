/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

import net.proteanit.sql.DbUtils;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class CoursesList extends javax.swing.JFrame {
    Connection con;
    Statement stmt;
    ResultSet rs;

    /**
     * Creates new form CoursesList
     */
    public CoursesList() {
        super("Courses List");
        initComponents();
        con = Connections.getConnection();
        showRecords();
        Toolkit toolkit = getToolkit();
        Dimension size = toolkit.getScreenSize();
        setLocation(size.width/2 - getWidth()/2,size.height/2 - getHeight()/2);
    }
    public void showRecords(){
        try{
            stmt = con.createStatement();
            String sql = "SELECT * FROM COURSE";
            ResultSet res = stmt.executeQuery(sql);
            CourseTabel.setModel(DbUtils.resultSetToTableModel(res));


        }catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }

    @SuppressWarnings("unchecked")
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        CourseTabel = new javax.swing.JTable();
        backButton = new javax.swing.JButton();
        RemoveCourse = new javax.swing.JButton();
        AddCourse = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        Home_Menue = new javax.swing.JMenu();
        HomeMenu = new javax.swing.JMenuItem();
        LogoutMenu = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Courses List", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Helvetica Neue", 1, 22), new java.awt.Color(0, 0, 153))); // NOI18N

        CourseTabel.setModel(new javax.swing.table.DefaultTableModel(
                new Object [][] {
                        {null, null, null, null},
                        {null, null, null, null},
                        {null, null, null, null},
                        {null, null, null, null}
                },
                new String [] {
                        "Title 1", "Title 2", "Title 3", "Title 4"
                }
        ));
        jScrollPane1.setViewportView(CourseTabel);

        backButton.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/previous (1).png")); // NOI18N
        backButton.setText("back");
        backButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backButtonActionPerformed(evt);
            }
        });

        RemoveCourse.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/delete (1).png")); // NOI18N
        RemoveCourse.setText("Remove");
        RemoveCourse.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                RemoveCourseActionPerformed(evt);
            }
        });

        AddCourse.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/add (1).png")); // NOI18N
        AddCourse.setText("Add");
        AddCourse.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AddCourseActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGap(18, 18, 18)
                                .addComponent(AddCourse, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(RemoveCourse, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(backButton, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(28, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(backButton, javax.swing.GroupLayout.DEFAULT_SIZE, 34, Short.MAX_VALUE)
                                        .addComponent(AddCourse, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(RemoveCourse, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addContainerGap(17, Short.MAX_VALUE))
        );

        Home_Menue.setText("File");

        HomeMenu.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_H, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        HomeMenu.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/home-button (2).png")); // NOI18N
        HomeMenu.setText("Home");
        HomeMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                HomeMenuActionPerformed(evt);
            }
        });
        Home_Menue.add(HomeMenu);

        LogoutMenu.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_L, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        LogoutMenu.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/logout (3).png")); // NOI18N
        LogoutMenu.setText("Logout");
        LogoutMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LogoutMenuActionPerformed(evt);
            }
        });
        Home_Menue.add(LogoutMenu);

        jMenuBar1.add(Home_Menue);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>

    private void HomeMenuActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Admin admin = new Admin();
        admin.setVisible(true);
    }

    private void LogoutMenuActionPerformed(java.awt.event.ActionEvent evt) {

        setVisible(false);
        Test Login = new Test();
        Login.setVisible(true);
    }

    private void backButtonActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Admin ad = new Admin();
        ad.setVisible(true);
    }

    private void AddCourseActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        AddCourse ac = new AddCourse();
        ac.setVisible(true);
    }

    private void RemoveCourseActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            int row = CourseTabel.getSelectedRow();
            if (row == -1) {
                JOptionPane.showMessageDialog(null, "No row selected. Please select a row to delete.");
                return;
            }
            String Code = CourseTabel.getModel().getValueAt(row, 0).toString();

            String query = "DELETE FROM Course WHERE Code = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, Code);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                DefaultTableModel model = (DefaultTableModel) CourseTabel.getModel();
                model.removeRow(row);
                JOptionPane.showMessageDialog(null, "Data is successfully deleted");
            } else {
                JOptionPane.showMessageDialog(null, "Failed to delete data");
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    public static void main(String[] args) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(CoursesList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(CoursesList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(CoursesList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(CoursesList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CoursesList().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify
    private javax.swing.JButton AddCourse;
    private javax.swing.JTable CourseTabel;
    private javax.swing.JMenuItem HomeMenu;
    private javax.swing.JMenu Home_Menue;
    private javax.swing.JMenuItem LogoutMenu;
    private javax.swing.JButton RemoveCourse;
    private javax.swing.JButton backButton;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration
}
