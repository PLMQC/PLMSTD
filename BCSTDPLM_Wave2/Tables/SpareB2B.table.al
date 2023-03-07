table 33000899 "Spare B2B"
{

    Caption = 'Spare';

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if ID <> xRec.ID then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."Machine Spare Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            DataClassification = CustomerContent;
            TableRelation = "Equipment B2B";

            trigger OnValidate();
            begin
                if Machine.GET("Machine ID") then
                    "Machine Name" := Machine.Name
                else
                    "Machine Name" := '';
            end;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Component ID"; Code[20])
        {
            Caption = 'Component ID';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                if PAGE.RUNMODAL(0, PMSparesMasterRec) = ACTION::LookupOK then begin
                    "Component ID" := PMSparesMasterRec."Component ID";
                    "Component Name" := PMSparesMasterRec."Component Name";
                end else begin
                    "Component ID" := '';
                    "Component Name" := '';
                end;
            end;
        }
        field(5; "Component Name"; Text[50])
        {
            Caption = 'Component Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Item ID"; Code[20])
        {
            Caption = 'Item ID';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                MachineSetup.GET();
                SubItemRec.SETRANGE("Item Category Code", MachineSetup."Item Category Code");
                if PAGE.RUNMODAL(0, SubItemRec) = ACTION::LookupOK then begin
                    "Item ID" := SubItemRec."No.";
                    "Item Name" := SubItemRec.Description;
                    "Availablity Lead Time" := SubItemRec."Lead Time Calculation";
                    "Unit of Measure" := SubItemRec."Base Unit of Measure";
                end else begin
                    "Item ID" := '';
                    "Item Name" := '';
                end;
            end;
        }
        field(7; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Nos."; Integer)
        {
            Caption = 'Nos.';
            DataClassification = CustomerContent;
        }
        field(9; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(10; "Sl. No."; Integer)
        {
            BlankZero = true;
            Caption = 'Sl. No.';
            DataClassification = CustomerContent;
        }
        field(11; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(12; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(13; "Part No."; Text[50])
        {
            Caption = 'Part No.';
            DataClassification = CustomerContent;
        }
        field(14; Specifications; Code[20])
        {
            Caption = 'Specifications';
            DataClassification = CustomerContent;
        }
        field(15; "Availablity Lead Time"; DateFormula)
        {
            Caption = 'Availablity Lead Time';
            DataClassification = CustomerContent;
        }
        field(16; Address; Code[30])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(17; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(19; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }
        field(20; Inventory; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item ID")));
            Caption = 'Inventory';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; ID, "Machine ID", "Line No.")
        {
        }
        key(Key2; "Sl. No.")
        {
        }
        key(Key3; "Machine ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if ID = '' then begin
            MachineSetup.GET();
            MachineSetup.TESTFIELD("Machine Spare Nos.");
            NoSeriesMgt.InitSeries(MachineSetup."Machine Spare Nos.", xRec."No. Series", 0D, ID, "No. Series");
        end;
        if Machine.GET("Machine ID") then
            "Machine Name" := Machine.Name;
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        SubItemRec: Record Item;
        PMSparesMasterRec: Record "Spare Master B2B";
        Machine: Record "Equipment B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure Attachments();
    var
        Attachment: Record "Attachment Documents B2B";
    begin
        Attachment.RESET();
        Attachment.SETRANGE("Table Id", DATABASE::"Spare B2B");
        Attachment.SETRANGE("Document No.", ID);
        PAGE.RUNMODAL(PAGE::"Attachments Document B2B", Attachment);
    end;
}

