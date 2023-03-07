table 33000906 "PM Job OP Particulars B2B"
{

    Caption = 'PM Job Operation Particulars';
    DrillDownPageID = "PM Job OP Particulars B2B";
    LookupPageID = "PM Job OP Particulars B2B";

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
                    NoSeriesMgt.TestManual(MachineSetup."Maint. Sch. TempLineNo");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "ScheduleTemplate ID"; Code[20])
        {
            Caption = 'ScheduleTemplate ID';
            DataClassification = CustomerContent;
        }
        field(3; "Line Type"; Code[20])
        {
            Caption = 'Line Type';
            TableRelation = "Line Type B2B".Code;
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin

                if LineType.GET("Line Type") then
                    "Line Type Name" := LineType.Description
                else
                    "Line Type Name" := '';

                CheckLineType();
            end;
        }
        field(4; "Line Type Name"; Code[50])
        {
            Caption = 'Line Type Name';
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(6; "Sl. No."; Integer)
        {
            Caption = 'Sl. No.';
            DataClassification = CustomerContent;
        }
        field(7; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(8; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
        }
        field(20; "Time Required"; Decimal)
        {
            Caption = 'Time Required';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Time Required" > 0 then begin
                    ResourceRec.RESET();
                    ResourceRec.SETRANGE("No.", "I/R Code");
                    if ResourceRec.FIND('-') then
                        Amount := "Time Required" * "Unit Cost";
                end;
            end;
        }
        field(21; "I/R Code"; Code[20])
        {
            Caption = 'I/R Code';
            TableRelation = Resource;
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                MachineSetup.GET();
                if Item.GET("I/R Code") then;
                if ResourceRec.GET("I/R Code") then;

                Item.RESET();
                ResourceRec.RESET();

                if LineType.GET("Line Type") then begin
                    if LineType."Spares & Consumables" then begin
                        Item.SETRANGE(Item."Item Category Code", MachineSetup."Item Category Code");
                        if PAGE.RUNMODAL(0, Item) = ACTION::LookupOK then begin
                            "I/R Code" := Item."No.";
                            "I/R Description" := Item.Description;
                            UOM := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Unit Cost"
                        end;
                    end;

                    if LineType."Resource Equipment" then begin
                        if "Line Type" = ResEquipTextLbl then
                            ResourceRec.SETRANGE(ResourceRec.Type, ResourceRec.Type::Machine)
                        else begin
                            MaintSchPart.FINDFIRST();
                            PMResSkill.SETRANGE("Machine No.", MaintSchPart."Machine ID");
                            if PMResSkill.FINDFIRST() then
                                repeat
                                    ResourceRec.GET(PMResSkill."No.");
                                    ResourceRec.MARK(true);
                                until PMResSkill.NEXT() = 0;


                            Resource2.SETRANGE("Skill Type B2B", Resource2."Skill Type B2B"::All);
                            Resource2.SETRANGE(Type, Resource2.Type::Person);
                            if Resource2.FINDFIRST() then
                                repeat
                                    ResourceRec.GET(Resource2."No.");
                                    ResourceRec.MARK(true);
                                until Resource2.NEXT() = 0;
                            ResourceRec.MARKEDONLY(true);
                        end;
                        if PAGE.RUNMODAL(0, ResourceRec) = ACTION::LookupOK then begin
                            "I/R Code" := ResourceRec."No.";
                            "I/R Description" := ResourceRec.Name;
                            UOM := ResourceRec."Base Unit of Measure";
                            "Unit Cost" := ResourceRec."Unit Cost"
                        end;
                    end;
                end;
            end;

            trigger OnValidate();
            begin
                TESTFIELD("Line Type");
                Item.RESET();
                ResourceRec.RESET();

                if LineType.GET("Line Type") then begin
                    if LineType."Spares & Consumables" then begin
                        Item.SETRANGE("No.", "I/R Code");
                        if Item.GET("I/R Code") then begin
                            "I/R Code" := Item."No.";
                            "I/R Description" := Item.Description;
                            UOM := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Unit Cost"
                        end else
                            ERROR(Text001Lbl);
                    end;

                    if LineType."Resource Equipment" then begin
                        ResourceRec.SETRANGE("No.", "I/R Code");
                        if ResourceRec.GET("I/R Code") then begin
                            "I/R Code" := ResourceRec."No.";
                            "I/R Description" := ResourceRec.Name;
                            UOM := ResourceRec."Base Unit of Measure";
                            "Unit Cost" := ResourceRec."Unit Cost"
                        end else
                            ERROR(Text002Lbl);
                    end;
                end;
            end;
        }
        field(22; "I/R Description"; Text[100])
        {
            Caption = 'I/R Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(23; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if Quantity > 0 then begin
                    Item.RESET();
                    Item.SETRANGE("No.", "I/R Code");
                    if Item.FIND('-') then
                        Amount := Quantity * Item."Unit Cost";
                end;
                if LineType.GET("Line Type") then
                    if LineType."Spares & Consumables" then
                        Amount := Quantity * "Unit Cost"
                    else
                        if LineType."Resource Equipment" then
                            Amount := "Time Required" * "Unit Cost";
            end;
        }
        field(24; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if LineType.GET("Line Type") then
                    if LineType."Spares & Consumables" then
                        Amount := Quantity * "Unit Cost"
                    else
                        if LineType."Resource Equipment" then
                            Amount := "Time Required" * "Unit Cost";
            end;
        }
        field(25; UOM; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(26; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(30; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(31; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Equipment B2B";
        }
        field(32; "PM Line No."; Integer)
        {
            Caption = 'PM Line No.';
            DataClassification = CustomerContent;
        }
        field(35; Resource; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(38; "Spares & Consumables"; Boolean)
        {
            Caption = 'Spares & Consumables';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; ID, "ScheduleTemplate ID", "Line No.")
        {
            SumIndexFields = "Time Required";
        }
        key(Key2; "Line Type Name", "Sl. No.")
        {
        }
        key(Key3; "Sl. No.")
        {
        }
        key(Key4; "Line No.")
        {
        }
        key(Key5; "ScheduleTemplate ID")
        {
        }
        key(Key6; "Line Type", "Job Card No.")
        {
            SumIndexFields = Amount;
        }
        key(Key7; ID, "ScheduleTemplate ID", "Line Type Name", "Line No.")
        {
            SumIndexFields = "Unit Cost", Amount;
        }
        key(Key8; "Job Card No.", "Line Type Name")
        {
            SumIndexFields = "Unit Cost", Amount;
        }
        key(Key9; "Machine ID", "Line Type Name")
        {
            SumIndexFields = "Unit Cost", Amount;
        }
        key(Key10; "Job Card No.", "Machine ID", "PM Line No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if ID = '' then begin
            MachineSetup.GET();
            MachineSetup.TESTFIELD("Maint. Sch. TempLineNo");
            NoSeriesMgt.InitSeries(MachineSetup."Maint. Sch. TempLineNo", xRec."No. Series", 0D, ID, "No. Series");
        end;
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        Item: Record Item;
        ResourceRec: Record Resource;
        LineType: Record "Line Type B2B";
        Resource2: Record Resource;
        MaintSchPart: Record "Maintenance Schedule Part B2B";
        PMResSkill: Record "PM Resource Skill B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text001Lbl: Label 'Item No. does not exist';
        Text002Lbl: Label 'Resource No. does not exist';
        ResEquipTextLbl: Label 'RES. EQUIPMENT';
        Text003Lbl: Label 'Line type must not be Service.';

    procedure CheckLineType();
    begin
        if LineType.Service then
            ERROR(Text003Lbl);
    end;
}

