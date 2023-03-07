table 33000900 "Movement B2B"
{

    Caption = 'Movement';
    LookupPageID = "Movement List NR B2B";

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
                    NoSeriesMgt.TestManual(MachineSetup."PM Movement Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Line Type"; Option)
        {
            Caption = 'Line Type';
            DataClassification = CustomerContent;
            OptionCaption = '" ,In,Out"';
            OptionMembers = " ","In",Out;
        }
        field(3; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if Machine.GET("Machine ID") then
                    "Machine Name" := Machine.Name
                else
                    "Machine Name" := '';
            end;
        }
        field(4; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Spare ID"; Code[20])
        {
            Caption = 'Spare ID';
            DataClassification = CustomerContent;
        }
        field(6; "Send To"; Code[20])
        {
            Caption = 'Send To';
            TableRelation = Vendor;
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if Vendor.GET("Send To") then
                    "Vendor Name" := Vendor.Name
                else
                    "Vendor Name" := '';
            end;
        }
        field(7; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Movement Date"; Date)
        {
            Caption = 'Movement Date';
            DataClassification = CustomerContent;
        }
        field(9; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = '" ,Returnable,NonReturnable"';
            OptionMembers = " ",Returnable,NonReturnable;
            DataClassification = CustomerContent;
        }
        field(10; "Ref. No."; Code[20])
        {
            Caption = 'Ref. No.';
            DataClassification = CustomerContent;
            TableRelation = IF ("Line Type" = CONST(In)) "Movement B2B".ID WHERE("Line Type" = CONST(Out),
                                                                          "Machine ID" = FIELD("Machine ID"),
                                                                          Type = CONST(Returnable));
        }
        field(11; "Gate Pass No."; Code[20])
        {
            Caption = 'Gate Pass No.';
            DataClassification = CustomerContent;
        }
        field(12; "Gate Pass Date"; Date)
        {
            Caption = 'Gate Pass Date';
            DataClassification = CustomerContent;
        }
        field(13; "Sl. No."; Integer)
        {
            BlankZero = true;
            Caption = 'Sl. No.';
            DataClassification = CustomerContent;
        }
        field(14; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(16; "Movement Type ID"; Code[20])
        {
            Caption = 'Movement Type ID';
            DataClassification = CustomerContent;
            TableRelation = "Movement Type B2B";

            trigger OnValidate();
            begin
                if MovementType.GET("Movement Type ID") then
                    "Movement Type" := MovementType.Description
                else
                    "Movement Type" := '';
            end;
        }
        field(17; "Movement Type"; Text[50])
        {
            Caption = 'Movement Type';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                if "Line Type" = "Line Type"::"In" then begin
                    MESSAGE(Text001Lbl);
                    exit;
                end;
            end;
        }
        field(18; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(19; "Spare Item"; Text[50])
        {
            Caption = 'Spare Item';
            DataClassification = CustomerContent;
        }
        field(20; Quantity; Decimal)
        {
            BlankZero = true;
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if Quantity <= 0 then
                    FIELDERROR(Quantity, Text002Lbl);
                QtyCheck();
                Movement.SETRANGE(Movement.ID, "Ref. No.");
                if Movement.FIND('-') then
                    if (Movement.Quantity - TempQty) = 0 then
                        FIELDERROR(Quantity, Text003Lbl)
                    else
                        if Quantity > (Movement.Quantity - TempQty) then
                            FIELDERROR(Quantity, Text004Lbl);
            end;
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
            MachineSetup.TESTFIELD("PM Movement Nos.");
            NoSeriesMgt.InitSeries(MachineSetup."PM Movement Nos.", xRec."No. Series", 0D, ID, "No. Series");
        end;
        if Machine.GET("Machine ID") then
            "Machine Name" := Machine.Name;
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        Vendor: Record Vendor;
        Machine: Record "Equipment B2B";
        MovementQty: Record "Movement B2B";
        Movement: Record "Movement B2B";
        MovementType: Record "Movement Type B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;

        Text001Lbl: Label 'This is for only out option...';

        TempQty: Decimal;
        Text002Lbl: Label 'Must be greater than zero.';
        Text003Lbl: Label 'Already received.';
        Text004Lbl: Label 'Exceeding the out quantity.';

    procedure QtyCheck();
    begin
        if "Line Type" = "Line Type"::"In" then begin
            MovementQty.SETRANGE(MovementQty."Ref. No.", "Ref. No.");
            MovementQty.SETRANGE(MovementQty."Line Type", "Line Type"::"In");
            if MovementQty.FIND('-') then begin
                ;
                repeat
                    TempQty := TempQty + MovementQty.Quantity;
                until MovementQty.NEXT() = 0;
            end;
        end;
    end;
}

