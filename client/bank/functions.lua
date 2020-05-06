

bankTransaction = {}

Citizen.CreateThread(function()
    local encoded = GetResourceKvpString("transaction")
    if encoded ~= nil then
        decodeBankTransaction(encoded)
    else
        bankTransaction = {}
    end
end)

function EncodeBankTransaction(transac)
    local encoded = json.encode(transac)
    SetResourceKvp("transaction", encoded)
end

function decodeBankTransaction(transac)
    local decoded = json.decode(transac)
    bankTransaction = decoded
end


function AddBankTransaction(transaction)
    local h, m, s = NetworkGetGlobalMultiplayerClock()
    local transaction = transaction.." - "..h.."h "..m.."m "..s.."s"
    table.insert(bankTransaction, transaction)
    EncodeBankTransaction(bankTransaction)
end

function ClearTransaction()
    bankTransaction = {}
    EncodeBankTransaction(bankTransaction)
end