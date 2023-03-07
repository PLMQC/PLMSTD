table 33000912 "Equipment Group B2B"
{

    Caption = 'Equipment Type';
    LookupPageID = "Equipment Groups B2B";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
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
        Equipment.SETRANGE("Equipment Type", Code);
        if Equipment.FINDFIRST() then
            ERROR(Text001Lbl);
    end;

    trigger OnRename();
    begin
        Equipment.RESET();
        Equipment.SETRANGE("Equipment Type", Code);
        if Equipment.FINDFIRST() then
            ERROR(Text001Lbl);
    end;

    var
        Equipment: Record "Equipment B2B";
        Text001Lbl: Label 'Equipment group assigned.';
}

