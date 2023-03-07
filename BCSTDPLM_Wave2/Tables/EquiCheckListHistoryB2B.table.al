table 33000938 "Equi. Check List History B2B"
{

    Caption = 'Equipment Check List History';
    DrillDownPageID = "Equipment Check List B2B";
    LookupPageID = "Equipment Check List B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B"."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CLEAR("Machine Name");
                Machine.GET("Machine ID");
                "Machine Name" := Machine.Name
            end;
        }
        field(2; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = "Check List Parameters B2B".Code;
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                CLEAR(Description);
                PLMChecklist.GET(Code);
                Description := PLMChecklist.Description;
            end;
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = '" ,Ok,Not Ok"';
            OptionMembers = " ",Ok,"Not Ok";
            DataClassification = CustomerContent;
        }
        field(6; Date; Date)
        {
            Caption = 'Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Check List No."; Code[10])
        {
            Caption = 'Check List No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(10; Time; Time)
        {
            Caption = 'Time';
            DataClassification = CustomerContent;
        }
        field(15; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = '" ,Specs,CheckList"';
            DataClassification = CustomerContent;
            OptionMembers = " ",Specs,CheckList;
        }
        field(20; "Planned Value"; Code[20])
        {
            Caption = 'Planned Value';
            DataClassification = CustomerContent;
        }
        field(22; "Actual Value"; Code[20])
        {
            Caption = 'Actual Value';
            DataClassification = CustomerContent;
        }
        field(25; Units; Code[20])
        {
            Caption = 'Units';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Machine ID", "Code", Date, Time)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Machine: Record "Equipment B2B";
        PLMChecklist: Record "Check List Parameters B2B";
}

