table 33000902 "Attachment Documents B2B"
{

    Caption = 'Attachment';

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = CustomerContent;
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Attachment; BLOB)
        {
            Caption = 'Attachment';
            DataClassification = CustomerContent;
        }
        field(3; "Storage Type"; Option)
        {
            Caption = 'Storage Type';
            DataClassification = CustomerContent;
            OptionCaption = 'Embedded,Disk File,Exchange Storage';
            OptionMembers = Embedded,"Disk File","Exchange Storage";
        }
        field(4; "Storage Pointer"; Text[250])
        {
            Caption = 'Storage Pointer';
            DataClassification = CustomerContent;
        }
        field(5; "File Extension"; Text[250])
        {
            Caption = 'File Extension';
            DataClassification = CustomerContent;
        }
        field(6; "Read Only"; Boolean)
        {
            Caption = 'Read Only';
            DataClassification = CustomerContent;
        }
        field(7; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = CustomerContent;
        }
        field(8; "Last Time Modified"; Time)
        {
            Caption = 'Last Time Modified';
            DataClassification = CustomerContent;
        }
        field(13; "Merge Source"; BLOB)
        {
            Caption = 'Merge Source';
            DataClassification = CustomerContent;
        }
        field(14; "Email Message ID"; BLOB)
        {
            Caption = 'Email Message ID';
            DataClassification = CustomerContent;
        }
        field(15; "Email Entry ID"; BLOB)
        {
            Caption = 'Email Entry ID';
            DataClassification = CustomerContent;
        }
        field(16; "Email Message Checksum"; Integer)
        {
            Caption = 'Email Message Checksum';
            DataClassification = CustomerContent;
        }
        field(17; "Table Id"; Integer)
        {
            Caption = 'Table Id';
            DataClassification = CustomerContent;
        }
        field(18; "File Name"; Text[250])
        {
            Caption = 'File Name';
            DataClassification = CustomerContent;
        }
        field(19; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(20; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = CustomerContent;
        }
        field(21; "Filter Key 1"; Code[20])
        {
            Caption = 'Filter Key 1';
            DataClassification = CustomerContent;
        }
        field(22; "Filter Key 2"; Code[20])
        {
            Caption = 'Filter Key 2';
            DataClassification = CustomerContent;
        }
        field(23; "File Path"; Text[250])
        {
            Caption = 'File Path';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Table Id", "Document No.", "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();

    begin
        "Last Date Modified" := TODAY();
        "Last Time Modified" := TIME();
        "User Id" := Format(UserId());
        RMSetup.GET();

        "Storage Type" := RMSetup."Attachment Storage Type";
        if "Storage Type" = "Storage Type"::"Disk File" then begin
            RMSetup.TESTFIELD("Attachment Storage Location");
            "Storage Pointer" := RMSetup."Attachment Storage Location";
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := TODAY();
        "Last Time Modified" := TIME();
    end;

    var
        RMSetup: Record "Marketing Setup";
    /*
    Text002Lbl: Label 'The attachment is empty.';
    Text003Lbl: Label 'Attachment is already in use on this machine.';
    Text004Lbl: Label 'When you have saved your document, click Yes to import the document.';
    Text005Lbl: Label 'Export Attachment';
    Text006Lbl: Label 'Import Attachment';
    Text007Lbl: Label 'All Files (*.*)|*.*';
    Text008Lbl: Label 'Error during copying file: %1.';
    Text009Lbl: Label 'Do you want to remove %1?';
    Text010Lbl: Label 'External file could not be removed.';
    Text013Lbl: Label 'You can only print Microsoft Word documents.';
    Text014Lbl: Label 'You can only fax Microsoft Word documents.';
    Text015Lbl: Label 'The e-mail can not be displayed or has been deleted.';
    Text016Lbl: Label 'When you have finished working with a document, you should delete the associated temporary file. Please note that this will not delete the document.\\Do you want to delete the temporary file?';
    Text020Lbl: Label 'An Outlook dialog box is open. Close it and try again.';
    CouldNotActivateOutlookErr: Label 'Cannot connect to Microsoft Outlook. If Microsoft Outlook is already running, make sure that you are not running either Microsoft Dynamics NAV or Microsoft Outlook as administrator. Close all instances of Microsoft Outlook and try again.';
    UnspecifiedOutlookErr: Label '" Microsoft Outlook cannot display the message. Make sure that Microsoft Outlook is configured with access to the message that you are trying to open."';
    TempBlobVar: Record TempBlob;
    RMSetup: Record "Marketing Setup";
    FileMgt: Codeunit "File Management";
    AttachmentMgt: Codeunit AttachmentManagement;
    DefaultText: Label 'Default.';
*/
    procedure ImportAttachment(ImportFromFile: Text[260]; IsTemporary: Boolean): Boolean;
    var
    //FileMgt: Codeunit "File Management";
    // Attachment2: Record Attachment;
    // FileName: Text[260];
    // NewAttachmentNo: Integer;
    begin
        /* TESTFIELD("Read Only", false);
         if IsTemporary then begin
             FileName := FileMgt.BLOBImport(TempBlob, ImportFromFile);
             if FileName <> '' then begin
                 Attachment := TempaBlob.Blob;
                 "File Name" := COPYSTR(FileMgt.GetFileName(FileName), 1, MAXSTRLEN("File Name"));
                 "File Extension" := COPYSTR(UPPERCASE(FileMgt.GetExtension(FileName)), 1, 250);
                 exit(true)
             end else
                 exit(false);
         end;

         FileName := ImportFromFile;
         FileName := FileMgt.BLOBImport(TempBlob, FileName);
         if FileName = '' then
             exit(false);
         Attachment := TempBlob.Blob;
         "File Name" := COPYSTR(FileMgt.GetFileName(FileName), 1, MAXSTRLEN("File Name"));
         "File Extension" := COPYSTR(UPPERCASE(FileMgt.GetExtension(FileName)), 1, 250);
         if MODIFY(true) then;
         exit(true);*/
    end;

    procedure ExportAttachment(var ExportToFile: Text): Boolean;
    var
    //: Text;
    // FileFilter: Text[260];
    begin
        /*CALCFIELDS(Attachment);
        if Attachment.HASVALUE() then begin
            ;
            TempBlob.Blob := Attachment;
            if ExportToFile = '' then begin
                ;
                FileName := DefaultText + "File Extension";
                ExportToFile := FileMgt.BLOBExport(TempBlob, FileName, true);
            end else begin
                ;
                ExportToFile := FileMgt.BLOBExport(TempBlob, ExportToFile, false);
            end;
            exit(true);
        end else begin
            ;
            if "File Name" <> '' then begin
                ExportToFile := FileMgt.UploadFileSilent("File Name");
                exit(true);
            end
            else
                exit(false)
        end;*/
    end;
}

