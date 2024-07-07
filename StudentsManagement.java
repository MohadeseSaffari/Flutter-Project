import net.proteanit.sql.DbUtils;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import java.awt.*;
import java.sql.*;

public class StudentsManagement extends javax.swing.JFrame {
    Connection con;
    Statement stmt;

    public StudentsManagement() {
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
            String sql = "SELECT * FROM Student_Courses";
            ResultSet res = stmt.executeQuery(sql);
            TStudentsTable.setModel(DbUtils.resultSetToTableModel(res));


        }catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        TStudentsTable = new javax.swing.JTable();
        AddButton = new javax.swing.JButton();
        RemoveButton = new javax.swing.JButton();
        BackButton = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        TIdText = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        CIdText = new javax.swing.JTextField();
        jMenuBar1 = new javax.swing.JMenuBar();
        Home_Menue = new javax.swing.JMenu();
        HomeMenue = new javax.swing.JMenuItem();
        Logout_Menue = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Your Students", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Helvetica Neue", 1, 20), new java.awt.Color(0, 0, 153))); // NOI18N

        TStudentsTable.setModel(new javax.swing.table.DefaultTableModel(
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
        TStudentsTable.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TStudentsTableMouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(TStudentsTable);

        AddButton.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/add (1).png")); // NOI18N
        AddButton.setText("Add");
        AddButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AddButtonActionPerformed(evt);
            }
        });

        RemoveButton.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/delete (1).png")); // NOI18N
        RemoveButton.setText("Remove");
        RemoveButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                RemoveButtonActionPerformed(evt);
            }
        });

        BackButton.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/previous (1).png")); // NOI18N
        BackButton.setText("Back");
        BackButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BackButtonActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Helvetica Neue", 1, 13)); // NOI18N
        jLabel1.setText("Student's Id");

        jLabel2.setFont(new java.awt.Font("Helvetica Neue", 1, 13)); // NOI18N
        jLabel2.setText("Course's Id");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(AddButton, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(35, 35, 35)
                                .addComponent(RemoveButton, javax.swing.GroupLayout.PREFERRED_SIZE, 111, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(28, 28, 28)
                                .addComponent(BackButton, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(27, 27, 27))
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addGap(48, 48, 48)
                                                .addComponent(jLabel1))
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addContainerGap()
                                                .addComponent(TIdText, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE))
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addGap(49, 49, 49)
                                                .addComponent(jLabel2))
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addContainerGap()
                                                .addComponent(CIdText, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(18, 18, Short.MAX_VALUE)
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 425, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 245, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addGap(22, 22, 22)
                                                .addComponent(jLabel1)
                                                .addGap(18, 18, 18)
                                                .addComponent(TIdText, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(27, 27, 27)
                                                .addComponent(jLabel2)
                                                .addGap(18, 18, 18)
                                                .addComponent(CIdText, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(AddButton, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                                .addComponent(BackButton, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addComponent(RemoveButton, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(18, 18, 18))
        );

        Home_Menue.setText("File");

        HomeMenue.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_H, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        HomeMenue.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/home-button (2).png")); // NOI18N
        HomeMenue.setText("Home");
        HomeMenue.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                HomeMenueActionPerformed(evt);
            }
        });
        Home_Menue.add(HomeMenue);

        Logout_Menue.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_L, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        Logout_Menue.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/logout (3).png")); // NOI18N
        Logout_Menue.setText("Logout");
        Logout_Menue.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Logout_MenueActionPerformed(evt);
            }
        });
        Home_Menue.add(Logout_Menue);

        jMenuBar1.add(Home_Menue);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>

    private void HomeMenueActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Teacherr tr = new Teacherr();
        tr.setVisible(true);
    }

    private void Logout_MenueActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Test object = new Test();
        object.setVisible(true);
    }

    private void AddButtonActionPerformed(java.awt.event.ActionEvent evt) {
        int student_id = Integer.parseInt(TIdText.getText());
        int course_id = Integer.parseInt(CIdText.getText());

        if (student_id == 0 || course_id == 0) {
            JOptionPane.showMessageDialog(rootPane, "Some fields are empty", "Error", JOptionPane.INFORMATION_MESSAGE);
        } else {
            try {
                String checkSql = "SELECT master_id FROM Course WHERE id = ?";
                PreparedStatement checkStmt = con.prepareStatement(checkSql);
                checkStmt.setInt(1, course_id);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    int courseTeacherId = rs.getInt("master_id");
                    int loggedInTeacherId = Session.getInstance().getLoggedInTeacherId();

                    if (courseTeacherId == loggedInTeacherId) {
                        String sql = "INSERT INTO Student_Courses (student_id, course_id) VALUES (?, ?)";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setInt(1, student_id);
                        stmt.setInt(2, course_id);
                        stmt.executeUpdate();
                        JOptionPane.showMessageDialog(null, "Data is successfully inserted");
                    } else {
                        JOptionPane.showMessageDialog(null, "You do not have permission to add students to this course");
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Course not found");
                }
            } catch (SQLException e) {
                if (e.getSQLState().equals("23000")) {
                    if (e.getMessage().contains("FOREIGN KEY (`student_id`)")) {
                        JOptionPane.showMessageDialog(null, "There is no student with this ID");
                    } else if (e.getMessage().contains("FOREIGN KEY (`course_id`)")) {
                        JOptionPane.showMessageDialog(null, "This is not an active subject");
                    } else {
                        JOptionPane.showMessageDialog(null, e.getMessage());
                    }
                } else {
                    JOptionPane.showMessageDialog(null, e.getMessage());
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
        }
    }



    private void RemoveButtonActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            int row = TStudentsTable.getSelectedRow();

            if (row == -1) {
                JOptionPane.showMessageDialog(null, "No row selected. Please select a row to delete.");
                return;
            }

            String id = TStudentsTable.getModel().getValueAt(row, 0).toString();

            String query = "DELETE FROM Student_Courses WHERE student_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                DefaultTableModel model = (DefaultTableModel) TStudentsTable.getModel();
                model.removeRow(row);
                JOptionPane.showMessageDialog(null, "Data is successfully deleted");
            } else {
                JOptionPane.showMessageDialog(null, "Failed to delete data");
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    private void BackButtonActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Teacherr tr = new Teacherr();
        tr.setVisible(true);
    }

    private void TStudentsTableMouseClicked(java.awt.event.MouseEvent evt) {
        int i = TStudentsTable.getSelectedRow();
        TableModel model = TStudentsTable.getModel();

        // Ensure the selected row is valid and columns exist
        if (i != -1 && model.getColumnCount() >= 2) {
            // Fetch and display the student ID and course ID in the text fields
            TIdText.setText(model.getValueAt(i, 0).toString());
            CIdText.setText(model.getValueAt(i, 1).toString());
        } else {
            JOptionPane.showMessageDialog(rootPane, "Invalid row or column configuration", "Error", JOptionPane.ERROR_MESSAGE);
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
            java.util.logging.Logger.getLogger(StudentsManagement.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(StudentsManagement.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(StudentsManagement.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(StudentsManagement.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new StudentsManagement().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify
    private javax.swing.JButton AddButton;
    private javax.swing.JButton BackButton;
    private javax.swing.JTextField CIdText;
    private javax.swing.JMenuItem HomeMenue;
    private javax.swing.JMenu Home_Menue;
    private javax.swing.JMenuItem Logout_Menue;
    private javax.swing.JButton RemoveButton;
    private javax.swing.JTextField TIdText;
    private javax.swing.JTable TStudentsTable;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane2;
    // End of variables declaration
}