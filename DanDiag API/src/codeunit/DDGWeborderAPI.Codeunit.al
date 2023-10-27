codeunit 50202 "DDG Weborder API"
{
    procedure setDDGWebOrder(orderNo: Code[20]): text
    var
        SalesHeader: Record "Sales Header";
    begin
        if not SalesHeader.get(SalesHeader."Document Type"::Order, orderNo) then
            exit('Order does not exist');

        SalesHeader.Validate("DDG Weborder", 'WEB');
        SalesHeader.Modify();

        exit('true');
    end;
}