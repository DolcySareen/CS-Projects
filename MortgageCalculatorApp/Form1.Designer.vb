<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.loanDataGBX = New System.Windows.Forms.GroupBox()
        Me.minimumNUD = New System.Windows.Forms.NumericUpDown()
        Me.maximumNUD = New System.Windows.Forms.NumericUpDown()
        Me.maximumTermLBL = New System.Windows.Forms.Label()
        Me.minimumTermLBL = New System.Windows.Forms.Label()
        Me.interestTBX = New System.Windows.Forms.TextBox()
        Me.amountTBX = New System.Windows.Forms.TextBox()
        Me.interestRateLBL = New System.Windows.Forms.Label()
        Me.mortgageAountLBL = New System.Windows.Forms.Label()
        Me.displayOptionsGBX = New System.Windows.Forms.GroupBox()
        Me.weeklyPaymentsRBN = New System.Windows.Forms.RadioButton()
        Me.biWeeklyPaymentsRBN = New System.Windows.Forms.RadioButton()
        Me.monthlyPaymentsRBN = New System.Windows.Forms.RadioButton()
        Me.titleLBL = New System.Windows.Forms.Label()
        Me.monthlyPmtsLBL = New System.Windows.Forms.Label()
        Me.calculatePaymentsBTN = New System.Windows.Forms.Button()
        Me.paymentsLBX = New System.Windows.Forms.ListBox()
        Me.messageLBL = New System.Windows.Forms.Label()
        Me.loanDataGBX.SuspendLayout()
        CType(Me.minimumNUD, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.maximumNUD, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.displayOptionsGBX.SuspendLayout()
        Me.SuspendLayout()
        '
        'loanDataGBX
        '
        Me.loanDataGBX.Controls.Add(Me.minimumNUD)
        Me.loanDataGBX.Controls.Add(Me.maximumNUD)
        Me.loanDataGBX.Controls.Add(Me.maximumTermLBL)
        Me.loanDataGBX.Controls.Add(Me.minimumTermLBL)
        Me.loanDataGBX.Controls.Add(Me.interestTBX)
        Me.loanDataGBX.Controls.Add(Me.amountTBX)
        Me.loanDataGBX.Controls.Add(Me.interestRateLBL)
        Me.loanDataGBX.Controls.Add(Me.mortgageAountLBL)
        Me.loanDataGBX.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.loanDataGBX.Location = New System.Drawing.Point(11, 43)
        Me.loanDataGBX.Margin = New System.Windows.Forms.Padding(2)
        Me.loanDataGBX.Name = "loanDataGBX"
        Me.loanDataGBX.Padding = New System.Windows.Forms.Padding(2)
        Me.loanDataGBX.Size = New System.Drawing.Size(228, 149)
        Me.loanDataGBX.TabIndex = 0
        Me.loanDataGBX.TabStop = False
        Me.loanDataGBX.Text = "Mortgage Data:"
        '
        'minimumNUD
        '
        Me.minimumNUD.Location = New System.Drawing.Point(175, 92)
        Me.minimumNUD.Maximum = New Decimal(New Integer() {25, 0, 0, 0})
        Me.minimumNUD.Minimum = New Decimal(New Integer() {15, 0, 0, 0})
        Me.minimumNUD.Name = "minimumNUD"
        Me.minimumNUD.Size = New System.Drawing.Size(42, 32)
        Me.minimumNUD.TabIndex = 8
        Me.minimumNUD.Value = New Decimal(New Integer() {15, 0, 0, 0})
        '
        'maximumNUD
        '
        Me.maximumNUD.Location = New System.Drawing.Point(175, 119)
        Me.maximumNUD.Maximum = New Decimal(New Integer() {30, 0, 0, 0})
        Me.maximumNUD.Minimum = New Decimal(New Integer() {20, 0, 0, 0})
        Me.maximumNUD.Name = "maximumNUD"
        Me.maximumNUD.Size = New System.Drawing.Size(42, 32)
        Me.maximumNUD.TabIndex = 7
        Me.maximumNUD.Value = New Decimal(New Integer() {20, 0, 0, 0})
        '
        'maximumTermLBL
        '
        Me.maximumTermLBL.AutoSize = True
        Me.maximumTermLBL.Location = New System.Drawing.Point(12, 119)
        Me.maximumTermLBL.Name = "maximumTermLBL"
        Me.maximumTermLBL.Size = New System.Drawing.Size(237, 26)
        Me.maximumTermLBL.TabIndex = 5
        Me.maximumTermLBL.Text = "Maximum term (years):"
        '
        'minimumTermLBL
        '
        Me.minimumTermLBL.AutoSize = True
        Me.minimumTermLBL.Location = New System.Drawing.Point(12, 92)
        Me.minimumTermLBL.Name = "minimumTermLBL"
        Me.minimumTermLBL.Size = New System.Drawing.Size(231, 26)
        Me.minimumTermLBL.TabIndex = 4
        Me.minimumTermLBL.Text = "Minimum term (years):"
        '
        'interestTBX
        '
        Me.interestTBX.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.interestTBX.Location = New System.Drawing.Point(174, 53)
        Me.interestTBX.Margin = New System.Windows.Forms.Padding(2)
        Me.interestTBX.Name = "interestTBX"
        Me.interestTBX.Size = New System.Drawing.Size(43, 32)
        Me.interestTBX.TabIndex = 3
        Me.interestTBX.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'amountTBX
        '
        Me.amountTBX.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.amountTBX.Location = New System.Drawing.Point(139, 22)
        Me.amountTBX.Margin = New System.Windows.Forms.Padding(2)
        Me.amountTBX.Name = "amountTBX"
        Me.amountTBX.Size = New System.Drawing.Size(78, 32)
        Me.amountTBX.TabIndex = 2
        Me.amountTBX.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'interestRateLBL
        '
        Me.interestRateLBL.AutoSize = True
        Me.interestRateLBL.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.interestRateLBL.Location = New System.Drawing.Point(12, 55)
        Me.interestRateLBL.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.interestRateLBL.Name = "interestRateLBL"
        Me.interestRateLBL.Size = New System.Drawing.Size(252, 26)
        Me.interestRateLBL.TabIndex = 1
        Me.interestRateLBL.Text = "Annual interest rate (%): "
        '
        'mortgageAountLBL
        '
        Me.mortgageAountLBL.AutoSize = True
        Me.mortgageAountLBL.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.mortgageAountLBL.Location = New System.Drawing.Point(12, 24)
        Me.mortgageAountLBL.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.mortgageAountLBL.Name = "mortgageAountLBL"
        Me.mortgageAountLBL.Size = New System.Drawing.Size(188, 26)
        Me.mortgageAountLBL.TabIndex = 0
        Me.mortgageAountLBL.Text = "Mortgage amount:"
        '
        'displayOptionsGBX
        '
        Me.displayOptionsGBX.Controls.Add(Me.weeklyPaymentsRBN)
        Me.displayOptionsGBX.Controls.Add(Me.biWeeklyPaymentsRBN)
        Me.displayOptionsGBX.Controls.Add(Me.monthlyPaymentsRBN)
        Me.displayOptionsGBX.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.displayOptionsGBX.Location = New System.Drawing.Point(11, 203)
        Me.displayOptionsGBX.Margin = New System.Windows.Forms.Padding(2)
        Me.displayOptionsGBX.Name = "displayOptionsGBX"
        Me.displayOptionsGBX.Padding = New System.Windows.Forms.Padding(2)
        Me.displayOptionsGBX.Size = New System.Drawing.Size(228, 110)
        Me.displayOptionsGBX.TabIndex = 1
        Me.displayOptionsGBX.TabStop = False
        Me.displayOptionsGBX.Text = "Payment Options:"
        '
        'weeklyPaymentsRBN
        '
        Me.weeklyPaymentsRBN.AutoSize = True
        Me.weeklyPaymentsRBN.Location = New System.Drawing.Point(5, 76)
        Me.weeklyPaymentsRBN.Name = "weeklyPaymentsRBN"
        Me.weeklyPaymentsRBN.Size = New System.Drawing.Size(210, 30)
        Me.weeklyPaymentsRBN.TabIndex = 11
        Me.weeklyPaymentsRBN.Text = "Weekly payments"
        Me.weeklyPaymentsRBN.UseVisualStyleBackColor = True
        '
        'biWeeklyPaymentsRBN
        '
        Me.biWeeklyPaymentsRBN.AutoSize = True
        Me.biWeeklyPaymentsRBN.ForeColor = System.Drawing.Color.Black
        Me.biWeeklyPaymentsRBN.Location = New System.Drawing.Point(5, 50)
        Me.biWeeklyPaymentsRBN.Name = "biWeeklyPaymentsRBN"
        Me.biWeeklyPaymentsRBN.Size = New System.Drawing.Size(247, 30)
        Me.biWeeklyPaymentsRBN.TabIndex = 10
        Me.biWeeklyPaymentsRBN.Text = "Bi-Monthly  payments"
        Me.biWeeklyPaymentsRBN.UseVisualStyleBackColor = True
        '
        'monthlyPaymentsRBN
        '
        Me.monthlyPaymentsRBN.AutoSize = True
        Me.monthlyPaymentsRBN.Checked = True
        Me.monthlyPaymentsRBN.Location = New System.Drawing.Point(5, 22)
        Me.monthlyPaymentsRBN.Name = "monthlyPaymentsRBN"
        Me.monthlyPaymentsRBN.Size = New System.Drawing.Size(214, 30)
        Me.monthlyPaymentsRBN.TabIndex = 9
        Me.monthlyPaymentsRBN.TabStop = True
        Me.monthlyPaymentsRBN.Text = "Monthly payments"
        Me.monthlyPaymentsRBN.UseVisualStyleBackColor = True
        '
        'titleLBL
        '
        Me.titleLBL.AutoSize = True
        Me.titleLBL.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.titleLBL.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.titleLBL.Location = New System.Drawing.Point(72, 9)
        Me.titleLBL.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.titleLBL.Name = "titleLBL"
        Me.titleLBL.Size = New System.Drawing.Size(406, 32)
        Me.titleLBL.TabIndex = 2
        Me.titleLBL.Text = "Enhanced Mortgage Calculator"
        '
        'monthlyPmtsLBL
        '
        Me.monthlyPmtsLBL.AutoSize = True
        Me.monthlyPmtsLBL.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.monthlyPmtsLBL.Location = New System.Drawing.Point(251, 43)
        Me.monthlyPmtsLBL.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.monthlyPmtsLBL.Name = "monthlyPmtsLBL"
        Me.monthlyPmtsLBL.Size = New System.Drawing.Size(210, 26)
        Me.monthlyPmtsLBL.TabIndex = 4
        Me.monthlyPmtsLBL.Text = "Mortgage payments:"
        '
        'calculatePaymentsBTN
        '
        Me.calculatePaymentsBTN.BackColor = System.Drawing.Color.Silver
        Me.calculatePaymentsBTN.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.calculatePaymentsBTN.Location = New System.Drawing.Point(254, 274)
        Me.calculatePaymentsBTN.Name = "calculatePaymentsBTN"
        Me.calculatePaymentsBTN.Size = New System.Drawing.Size(172, 34)
        Me.calculatePaymentsBTN.TabIndex = 12
        Me.calculatePaymentsBTN.Text = "Calculate Payments"
        Me.calculatePaymentsBTN.UseVisualStyleBackColor = False
        '
        'paymentsLBX
        '
        Me.paymentsLBX.FormattingEnabled = True
        Me.paymentsLBX.ItemHeight = 29
        Me.paymentsLBX.Location = New System.Drawing.Point(254, 67)
        Me.paymentsLBX.Name = "paymentsLBX"
        Me.paymentsLBX.Size = New System.Drawing.Size(172, 178)
        Me.paymentsLBX.TabIndex = 13
        '
        'messageLBL
        '
        Me.messageLBL.ForeColor = System.Drawing.Color.Blue
        Me.messageLBL.Location = New System.Drawing.Point(7, 343)
        Me.messageLBL.Name = "messageLBL"
        Me.messageLBL.Size = New System.Drawing.Size(456, 20)
        Me.messageLBL.TabIndex = 15
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(14.0!, 29.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(464, 372)
        Me.Controls.Add(Me.messageLBL)
        Me.Controls.Add(Me.paymentsLBX)
        Me.Controls.Add(Me.calculatePaymentsBTN)
        Me.Controls.Add(Me.monthlyPmtsLBL)
        Me.Controls.Add(Me.titleLBL)
        Me.Controls.Add(Me.displayOptionsGBX)
        Me.Controls.Add(Me.loanDataGBX)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Name = "Form1"
        Me.Text = "Enhanced Mortgage App"
        Me.loanDataGBX.ResumeLayout(False)
        Me.loanDataGBX.PerformLayout()
        CType(Me.minimumNUD, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.maximumNUD, System.ComponentModel.ISupportInitialize).EndInit()
        Me.displayOptionsGBX.ResumeLayout(False)
        Me.displayOptionsGBX.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents loanDataGBX As GroupBox
    Friend WithEvents interestRateLBL As Label
    Friend WithEvents mortgageAountLBL As Label
    Friend WithEvents displayOptionsGBX As GroupBox
    Friend WithEvents titleLBL As Label
    Friend WithEvents interestTBX As TextBox
    Friend WithEvents amountTBX As TextBox
    Friend WithEvents monthlyPmtsLBL As Label
    Friend WithEvents minimumNUD As NumericUpDown
    Friend WithEvents maximumNUD As NumericUpDown
    Friend WithEvents maximumTermLBL As Label
    Friend WithEvents minimumTermLBL As Label
    Friend WithEvents weeklyPaymentsRBN As RadioButton
    Friend WithEvents biWeeklyPaymentsRBN As RadioButton
    Friend WithEvents monthlyPaymentsRBN As RadioButton
    Friend WithEvents calculatePaymentsBTN As Button
    Friend WithEvents paymentsLBX As ListBox
    Friend WithEvents messageLBL As Label
End Class
