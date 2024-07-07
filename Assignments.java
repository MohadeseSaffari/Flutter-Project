import net.proteanit.sql.DbUtils;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import java.awt.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Assignments extends javax.swing.JFrame {
    Connection con;
    Statement stmt;


    public Assignments() {
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
            String sql = "SELECT * FROM Assignment";
            ResultSet res = stmt.executeQuery(sql);
            AssignmentTable.setModel(DbUtils.resultSetToTableModel(res));


        }catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        AssignmentTable = new javax.swing.JTable();
        AddButton = new javax.swing.JButton();
        RemoveButton = new javax.swing.JButton();
        UpdateButton = new javax.swing.JButton();
        BackButton = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        CourseIdText = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        AssignIdText = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        NameText = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        DeadLineDate = new com.toedter.calendar.JDateChooser();
        jMenuBar1 = new javax.swing.JMenuBar();
        Home_Menue = new javax.swing.JMenu();
        jMenuItem6 = new javax.swing.JMenuItem();
        Logout_Menue = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Assignment", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Helvetica Neue", 1, 20), new java.awt.Color(0, 0, 153))); // NOI18N

        AssignmentTable.setModel(new javax.swing.table.DefaultTableModel(
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
        AssignmentTable.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                AssignmentTableMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(AssignmentTable);

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

        UpdateButton.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/loading-arrow (1).png")); // NOI18N
        UpdateButton.setText("Update");
        UpdateButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                UpdateButtonActionPerformed(evt);
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
        jLabel1.setText("Course's Id");

        jLabel2.setFont(new java.awt.Font("Helvetica Neue", 1, 13)); // NOI18N
        jLabel2.setText("Assignment's Id");

        jLabel3.setFont(new java.awt.Font("Helvetica Neue", 1, 13)); // NOI18N
        jLabel3.setText("Name");

        jLabel4.setFont(new java.awt.Font("Helvetica Neue", 1, 13)); // NOI18N
        jLabel4.setText("DeadLine");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(42, 42, 42)
                                                                .addComponent(jLabel2))
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(71, 71, 71)
                                                                .addComponent(jLabel3))
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(50, 50, 50)
                                                                .addComponent(jLabel1))
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(61, 61, 61)
                                                                .addComponent(jLabel4)))
                                                .addGap(0, 31, Short.MAX_VALUE))
                                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                                .addGap(0, 0, Short.MAX_VALUE)
                                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                        .addComponent(NameText, javax.swing.GroupLayout.Alignment.TRAILING)
                                                        .addComponent(CourseIdText, javax.swing.GroupLayout.Alignment.TRAILING)
                                                        .addComponent(AssignIdText, javax.swing.GroupLayout.Alignment.TRAILING)
                                                        .addComponent(DeadLineDate, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE))))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addComponent(AddButton, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(RemoveButton, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                .addComponent(UpdateButton)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(BackButton)
                                                .addContainerGap())))
        );
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 23, Short.MAX_VALUE)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(AddButton)
                                        .addComponent(RemoveButton)
                                        .addComponent(UpdateButton)
                                        .addComponent(BackButton))
                                .addGap(23, 23, 23))
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(20, 20, 20)
                                .addComponent(jLabel2)
                                .addGap(18, 18, 18)
                                .addComponent(AssignIdText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(NameText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(24, 24, 24)
                                .addComponent(jLabel1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(CourseIdText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(30, 30, 30)
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(DeadLineDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jMenuBar1.setBackground(new java.awt.Color(0, 0, 0));

        Home_Menue.setText("File");

        jMenuItem6.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_H, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        jMenuItem6.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/home-button (2).png")); // NOI18N
        jMenuItem6.setText("Home");
        jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem6ActionPerformed(evt);
            }
        });
        Home_Menue.add(jMenuItem6);

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

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Teacherr tr = new Teacherr();
        tr.setVisible(true);
    }

    private void Logout_MenueActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Test login = new Test();
        login.setVisible(true);

    }

    private void AddButtonActionPerformed(java.awt.event.ActionEvent evt) {
        int id = Integer.parseInt(AssignIdText.getText());
        String Name = NameText.getText();
        int Course_id = Integer.parseInt(CourseIdText.getText());
        Date selectedDate = DeadLineDate.getDate();

        if (id == 0 || Name.isEmpty() || Course_id == 0 || selectedDate == null) {
            JOptionPane.showMessageDialog(rootPane, "Some fields are empty", "Error", JOptionPane.INFORMATION_MESSAGE);
        } else {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = sdf.format(selectedDate);
                String sql = "INSERT INTO ASSIGNMENT (id, Name, Course_id, DeadLine) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1,id);
                ps.setString(2, Name);
                ps.setInt(3, Course_id);
                ps.setString(4, formattedDate);
                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {
                    JOptionPane.showMessageDialog(null, "Data is successfully inserted");
                } else {
                    JOptionPane.showMessageDialog(null, "Failed to insert data");
                }

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
        }
    }

    private void RemoveButtonActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            int row = AssignmentTable.getSelectedRow();

            if (row == -1) {
                JOptionPane.showMessageDialog(null, "No row selected. Please select a row to delete.");
                return;
            }

            String name = AssignmentTable.getModel().getValueAt(row, 1).toString();

            String query = "DELETE FROM Assignment WHERE name = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                DefaultTableModel model = (DefaultTableModel) AssignmentTable.getModel();
                model.removeRow(row);
                JOptionPane.showMessageDialog(null, "Data is successfully deleted");
            } else {
                JOptionPane.showMessageDialog(null, "Failed to delete data");
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    private void UpdateButtonActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            int row = AssignmentTable.getSelectedRow();

            // Check if a row is selected
            if (row == -1) {
                JOptionPane.showMessageDialog(rootPane, "No row selected", "Error", JOptionPane.INFORMATION_MESSAGE);
                return;
            }

            // Get the primary key value from the selected row
            String value = AssignmentTable.getModel().getValueAt(row, 0).toString();

            // Prepare the update query
            String query = "UPDATE Assignment SET Name=?, Course_id=?, DeadLine=? WHERE id=?";
            PreparedStatement pst = con.prepareStatement(query);

            // Set the Name parameter
            pst.setString(1, NameText.getText());

            // Set the Course_id parameter
            pst.setInt(2, Integer.parseInt(CourseIdText.getText()));

            // Extract and set the DeadLine date from the JDateChooser
            java.util.Date utilDate = DeadLineDate.getDate();
            if (utilDate != null) {
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                pst.setDate(3, sqlDate);
            } else {
                JOptionPane.showMessageDialog(rootPane, "Deadline date is not set", "Error", JOptionPane.INFORMATION_MESSAGE);
                return;
            }

            // Set the primary key value
            pst.setString(4, value);

            // Execute the update
            pst.executeUpdate();

            // Update the table model
            DefaultTableModel model = (DefaultTableModel) AssignmentTable.getModel();
            model.setRowCount(0);
            showRecords();

            // Show success message
            JOptionPane.showMessageDialog(null, "Data is successfully updated");

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Invalid input: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "An unexpected error occurred: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }


    private void BackButtonActionPerformed(java.awt.event.ActionEvent evt) {
        setVisible(false);
        Teacherr tr = new Teacherr();
        tr.setVisible(true);
    }

    private void AssignmentTableMouseClicked(java.awt.event.MouseEvent evt) {
        int i = AssignmentTable.getSelectedRow();
        TableModel model = AssignmentTable.getModel();

        if (i != -1 && model.getColumnCount() >= 4) {
            AssignIdText.setText(model.getValueAt(i, 0).toString());
            NameText.setText(model.getValueAt(i, 1).toString());
            CourseIdText.setText(model.getValueAt(i, 2).toString());

            // Fetch and set the date in the JDateChooser
            Object dateObject = model.getValueAt(i, 3); // Assuming the date is in the 4th column
            if (dateObject != null) {
                if (dateObject instanceof Date) {
                    DeadLineDate.setDate((Date) dateObject);
                } else if (dateObject instanceof String) {
                    try {
                        DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // Adjust the date format as needed
                        Date date = df.parse((String) dateObject);
                        DeadLineDate.setDate(date);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            JOptionPane.showMessageDialog(rootPane, "Invalid row or column configuration", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    public static void main(String args[]) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Assignments.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Assignments.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Assignments.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Assignments.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Assignments().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify
    private javax.swing.JButton AddButton;
    private javax.swing.JTextField AssignIdText;
    private javax.swing.JTable AssignmentTable;
    private javax.swing.JButton BackButton;
    private javax.swing.JTextField CourseIdText;
    private com.toedter.calendar.JDateChooser DeadLineDate;
    private javax.swing.JMenu Home_Menue;
    private javax.swing.JMenuItem Logout_Menue;
    private javax.swing.JTextField NameText;
    private javax.swing.JButton RemoveButton;
    private javax.swing.JButton UpdateButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration
}
