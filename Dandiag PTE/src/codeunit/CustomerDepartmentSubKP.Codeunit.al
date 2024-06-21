codeunit 50300 "Customer Department Sub. KP"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Sell-to Contact No.", false, false)]
    local procedure ValidateCustomerDepartment(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        Contact: Record Contact;
    begin
        if Rec."Sell-to Contact No." <> xRec."Sell-to Contact No." then begin
            Contact.get(Rec."Sell-to Contact No.");
            rec.Validate("Customer Department KP", Contact."Customer Department KP");
        end;

    end;
}