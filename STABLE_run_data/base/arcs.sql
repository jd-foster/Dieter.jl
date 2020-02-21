-- This query creates arcs between all nodes by default:
-- CREATE VIEW Arcs_Def AS
-- SELECT FromNodes, ToNodes, 1 as IncludeFlag
-- FROM
-- (SELECT RegionID as FromNodes, RegionType as FromType
-- FROM Regions
-- WHERE RegionType=='TxZone')
-- JOIN
-- (SELECT RegionID as ToNodes, RegionType as ToType
-- FROM Regions
-- WHERE RegionType=='TxZone')
-- ON  FromType = ToType
-- WHERE FromNodes != ToNodes
--
-- SELECT FromNode, ToNode, TransferLimit
-- FROM
-- (SELECT FromNode, ToNode, ForwardLimit AS TransferLimit
-- FROM Arcs
-- UNION
-- SELECT ToNode AS FromNode, FromNode AS ToNode, ReverseLimit AS TransferLimit
-- FROM Arcs)
SELECT * FROM Arcs_Def