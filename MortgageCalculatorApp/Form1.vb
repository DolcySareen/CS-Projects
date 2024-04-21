Option Strict On
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' paymentsLBX.Items.Add("Terms           Payments")
        messageLBL.Text = "Monthly payments are due on 1st each month"
        calculatePaymentsBTN.Enabled = False

    End Sub
    Private Sub calculatePaymentsBTN_Click(sender As Object, e As EventArgs) Handles calculatePaymentsBTN.Click
        Dim amount As String = amountTBX.Text
        Dim interest As String = interestTBX.Text
        Dim minimumYears As Integer = CInt(minimumNUD.Value)
        Dim maximumYears As Integer = CInt(maximumNUD.Value)
        Dim numberOfPayments = 0
        Dim monthlyPayment As Decimal = 0
        Dim payment As String = ""
        If monthlyPaymentsRBN.Checked AndAlso minimumNUD.Value < maximumNUD.Value _
            AndAlso Not (amountTBX.Text.Equals("")) AndAlso Not (interestTBX.Text.Equals("")) Then
            For i As Integer = minimumYears To maximumYears
                numberOfPayments = i * 12
                monthlyPayment = CDec(Pmt(CDbl(interest) / 12 / 100, numberOfPayments, -CDbl(amount)))
                payment = String.Format("{0,-11:s}{1,9:C}", i & " Years", monthlyPayment)
                paymentsLBX.Items.Add(payment)
            Next


        ElseIf biWeeklyPaymentsRBN.Checked AndAlso minimumNUD.Value < maximumNUD.Value _
          AndAlso Not (amountTBX.Text.Equals("")) AndAlso Not (interestTBX.Text.Equals("")) Then
            For i As Integer = minimumYears To maximumYears
                numberOfPayments = i * 12 * 2
                monthlyPayment = CDec(Pmt(CDbl(interest) / 24 / 100, numberOfPayments, -CDbl(amount)))
                payment = String.Format("{0,-11:s}{1,9:C}", i & " Years", monthlyPayment)
                paymentsLBX.Items.Add(payment)
            Next


        ElseIf weeklyPaymentsRBN.Checked AndAlso minimumNUD.Value < maximumNUD.Value _
      AndAlso Not (amountTBX.Text.Equals("")) AndAlso Not (interestTBX.Text.Equals("")) Then

            For i As Integer = minimumYears To maximumYears
                numberOfPayments = i * 52
                monthlyPayment = CDec(Pmt(CDbl(interest) / 52 / 100, numberOfPayments, -CDbl(amount)))
                payment = String.Format("{0,-11:s}{1,9:C}", i & " Years", monthlyPayment)
                paymentsLBX.Items.Add(payment)
            Next


        End If

    End Sub

    Private Sub interestTBX_TextChanged(sender As Object, e As EventArgs) Handles interestTBX.TextChanged _
        , amountTBX.TextChanged, monthlyPaymentsRBN.CheckedChanged, biWeeklyPaymentsRBN.CheckedChanged, monthlyPaymentsRBN.CheckedChanged
        If Not amountTBX.Text.Equals("") AndAlso Not interestTBX.Text.Equals("") Then
            calculatePaymentsBTN.Enabled = True
        Else
            calculatePaymentsBTN.Enabled = False
        End If

        paymentsLBX.Items.Clear()
        paymentsLBX.Items.Insert(0, "Term            Payments")
        Dim s As String
        If monthlyPaymentsRBN.Checked Then
            s = "Monthly payments are due on 1st each month"
            messageLBL.Text = s
        ElseIf biWeeklyPaymentsRBN.Checked Then
            s = "Bi-Monthly payments are due on 1st and 15th each month"
            messageLBL.Text = s
        ElseIf weeklyPaymentsRBN.Checked Then
            s = "Weekly payments are due on each monday at 7.00 a.m"
            messageLBL.Text = s
        End If
    End Sub

    Private Sub minimumNUD_ValueChanged(sender As Object, e As EventArgs) Handles minimumNUD.ValueChanged
        If CInt(minimumNUD.Value) > CInt(maximumNUD.Value) Then
            maximumNUD.Value = maximumNUD.Value + 1
        End If
    End Sub

    Private Sub maximumNUD_ValueChanged(sender As Object, e As EventArgs) Handles maximumNUD.ValueChanged
        If CInt(maximumNUD.Value) < CInt(minimumNUD.Value) Then
            minimumNUD.Value = minimumNUD.Value - 1
        End If
    End Sub
End Class
