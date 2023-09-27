pageextension 50301 SalesOrderListKP extends "Sales Order List"
{
    layout
    {
        addafter("External Document No.")
        {
            field("DDG Servicereport No."; Rec."DDG Servicereport No.")
            {
                ApplicationArea = All;
                ToolTip = 'DDG Servicereport No.';
            }

        }
    }
}