table 33000939 "Equi. Specs List History B2B"
{

    Caption = 'Equipment Specs List History';

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

            trigger OnValidate();
            begin

                if xRec.Status <> Status then
                    "Last Modified Date" := WORKDATE();
            end;
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
            OptionMembers = " ",Specs,CheckList;
            DataClassification = CustomerContent;
        }
        field(20; "Before Maintenance"; Code[20])
        {
            Caption = 'Before Maintenance';
            DataClassification = CustomerContent;
        }
        field(22; "After Maintenance"; Code[20])
        {
            Caption = 'After Maintenance';
            DataClassification = CustomerContent;
        }
        field(25; Units; Code[20])
        {
            Caption = 'Units';
            DataClassification = CustomerContent;
        }
        field(26; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
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

