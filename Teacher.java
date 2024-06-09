public class Teacher extends javax.swing.JFrame {
    
    public Teacher() {
        initComponents();
    }

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPopupMenu1 = new javax.swing.JPopupMenu();
        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        Add_Student_button = new javax.swing.JButton();
        Remove_Student_button = new javax.swing.JButton();
        StudentList_button = new javax.swing.JButton();
        Add_Course_button = new javax.swing.JButton();
        Remove_Course_button = new javax.swing.JButton();
        CoursList_button = new javax.swing.JButton();
        Set_Assignment_button = new javax.swing.JButton();
        Delete_Assignment_button = new javax.swing.JButton();
        ChangeAssignmentDeadLine_button = new javax.swing.JButton();
        SetProjecr_button = new javax.swing.JButton();
        DeletProject_button = new javax.swing.JButton();
        ChangeProjectDeadLine_button = new javax.swing.JButton();
        Add_Score_button = new javax.swing.JButton();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        Home_Menue = new javax.swing.JMenu();
        jMenuItem6 = new javax.swing.JMenuItem();
        Logout_Menue = new javax.swing.JMenuItem();

        jMenu3.setText("File");
        jMenuBar2.add(jMenu3);

        jMenu4.setText("Edit");
        jMenuBar2.add(jMenu4);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Home", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Helvetica Neue", 1, 22), new java.awt.Color(0, 0, 153))); // NOI18N

        jLabel1.setFont(new java.awt.Font("Noteworthy", 1, 16)); // NOI18N
        jLabel1.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/teacher (1) (3).png")); // NOI18N
        jLabel1.setText("Teacher Accesses");

        Add_Student_button.setText("Add Student");
        Add_Student_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Add_Student_buttonActionPerformed(evt);
            }
        });

        Remove_Student_button.setText("Remove Student");
        Remove_Student_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Remove_Student_buttonActionPerformed(evt);
            }
        });

        StudentList_button.setText("Students List");
        StudentList_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                StudentList_buttonActionPerformed(evt);
            }
        });

        Add_Course_button.setText("Add Course");
        Add_Course_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Add_Course_buttonActionPerformed(evt);
            }
        });

        Remove_Course_button.setText("Remove Course");
        Remove_Course_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Remove_Course_buttonActionPerformed(evt);
            }
        });

        CoursList_button.setText("Courses List");
        CoursList_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CoursList_buttonActionPerformed(evt);
            }
        });

        Set_Assignment_button.setText("Set Assignment");
        Set_Assignment_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Set_Assignment_buttonActionPerformed(evt);
            }
        });

        Delete_Assignment_button.setText("Delete Assignment");
        Delete_Assignment_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Delete_Assignment_buttonActionPerformed(evt);
            }
        });

        ChangeAssignmentDeadLine_button.setText("Change DeadLine");
        ChangeAssignmentDeadLine_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ChangeAssignmentDeadLine_buttonActionPerformed(evt);
            }
        });

        SetProjecr_button.setText("Set a new Project");
        SetProjecr_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SetProjecr_buttonActionPerformed(evt);
            }
        });

        DeletProject_button.setText("Delete Project");
        DeletProject_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                DeletProject_buttonActionPerformed(evt);
            }
        });

        ChangeProjectDeadLine_button.setText("Change Dead Line");
        ChangeProjectDeadLine_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ChangeProjectDeadLine_buttonActionPerformed(evt);
            }
        });

        Add_Score_button.setText("Add Score");
        Add_Score_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Add_Score_buttonActionPerformed(evt);
            }
        });

        jLabel6.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/Student (2).png")); // NOI18N

        jLabel7.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/training (1).png")); // NOI18N

        jLabel8.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/assignment (1).png")); // NOI18N

        jLabel9.setIcon(new javax.swing.ImageIcon("/Users/mohsaffari/Downloads/project-management (1).png")); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(45, 45, 45)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(StudentList_button, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Remove_Student_button)
                            .addComponent(Add_Score_button, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Add_Student_button, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(35, 35, 35)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(Add_Course_button, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(Remove_Course_button, javax.swing.GroupLayout.DEFAULT_SIZE, 135, Short.MAX_VALUE)
                            .addComponent(CoursList_button, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 33, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(ChangeAssignmentDeadLine_button, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Delete_Assignment_button)
                            .addComponent(Set_Assignment_button, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(9, 9, 9))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel3)
                        .addGap(91, 91, 91)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addGap(84, 84, 84)
                                .addComponent(jLabel8))
                            .addComponent(jLabel4)
                            .addComponent(jLabel1))))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addGap(77, 77, 77))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(25, 25, 25)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(ChangeProjectDeadLine_button)
                                    .addComponent(DeletProject_button, javax.swing.GroupLayout.PREFERRED_SIZE, 137, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(SetProjecr_button, javax.swing.GroupLayout.PREFERRED_SIZE, 137, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(74, 74, 74)
                                .addComponent(jLabel9)))
                        .addGap(65, 65, 65))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(jLabel2)
                                .addComponent(jLabel3))
                            .addComponent(jLabel4))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8)
                            .addComponent(jLabel9)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel7)
                            .addComponent(jLabel6))
                        .addGap(21, 21, 21)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(Add_Student_button, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Add_Course_button, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Set_Assignment_button, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SetProjecr_button, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(Remove_Student_button, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Remove_Course_button, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Delete_Assignment_button, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(DeletProject_button, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(StudentList_button, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(CoursList_button, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(ChangeAssignmentDeadLine_button, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(ChangeProjectDeadLine_button, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(Add_Score_button, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)))
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
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Remove_Course_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Remove_Course_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_Remove_Course_buttonActionPerformed

    private void DeletProject_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_DeletProject_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_DeletProject_buttonActionPerformed

    private void Add_Student_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Add_Student_buttonActionPerformed
        // TODO add your handling code here:
        setVisible(false);
        AddStudent ad = new AddStudent(1);
        ad.setVisible(true);
    }//GEN-LAST:event_Add_Student_buttonActionPerformed

    private void Remove_Student_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Remove_Student_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_Remove_Student_buttonActionPerformed

    private void StudentList_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_StudentList_buttonActionPerformed
        // TODO add your handling code here:
        setVisible(false);
        StudentsList sl = new StudentsList(1);
        sl.setVisible(true);
    }//GEN-LAST:event_StudentList_buttonActionPerformed

    private void Add_Score_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Add_Score_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_Add_Score_buttonActionPerformed

    private void Add_Course_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Add_Course_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_Add_Course_buttonActionPerformed

    private void CoursList_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CoursList_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_CoursList_buttonActionPerformed

    private void Set_Assignment_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Set_Assignment_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_Set_Assignment_buttonActionPerformed

    private void Delete_Assignment_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Delete_Assignment_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_Delete_Assignment_buttonActionPerformed

    private void ChangeAssignmentDeadLine_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ChangeAssignmentDeadLine_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_ChangeAssignmentDeadLine_buttonActionPerformed

    private void SetProjecr_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SetProjecr_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SetProjecr_buttonActionPerformed

    private void ChangeProjectDeadLine_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ChangeProjectDeadLine_buttonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_ChangeProjectDeadLine_buttonActionPerformed

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem6ActionPerformed
        // TODO add your handling code here:
        setVisible(false);
        Teacher tr = new Teacher();
        tr.setVisible(true);
    }//GEN-LAST:event_jMenuItem6ActionPerformed

    private void Logout_MenueActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Logout_MenueActionPerformed
        // TODO add your handling code here:
        setVisible(false);
        Login login = new Login();
        login.setVisible(true);
        
    }//GEN-LAST:event_Logout_MenueActionPerformed

    public static void main(String args[]) {

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Teacher().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Add_Course_button;
    private javax.swing.JButton Add_Score_button;
    private javax.swing.JButton Add_Student_button;
    private javax.swing.JButton ChangeAssignmentDeadLine_button;
    private javax.swing.JButton ChangeProjectDeadLine_button;
    private javax.swing.JButton CoursList_button;
    private javax.swing.JButton DeletProject_button;
    private javax.swing.JButton Delete_Assignment_button;
    private javax.swing.JMenu Home_Menue;
    private javax.swing.JMenuItem Logout_Menue;
    private javax.swing.JButton Remove_Course_button;
    private javax.swing.JButton Remove_Student_button;
    private javax.swing.JButton SetProjecr_button;
    private javax.swing.JButton Set_Assignment_button;
    private javax.swing.JButton StudentList_button;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPopupMenu jPopupMenu1;
    // End of variables declaration//GEN-END:variables
}
