table 33000915 "Specification Templates B2B"
{

    Caption = 'Specification Templates';
    LookupPageID = "Specification Templates B2B";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        Equipment.RESET();
        Equipment.SETRANGE("Template No.", Code);
        if Equipment.FINDFIRST() then
            ERROR(Text001Lbl);
    end;

    trigger OnRename();
    begin
        Equipment.RESET();
        Equipment.SETRANGE("Template No.", Code);
        if Equipment.FINDFIRST() then
            ERROR(Text001Lbl);
    end;

    var
        Equipment: Record "Equipment B2B";
        Text001Lbl: Label 'Specification template assigned.';
}

