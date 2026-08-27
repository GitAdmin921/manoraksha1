# Access control matrix

| Capability | Victim | Counsellor | District | State | National | Admin |
|---|---|---|---|---|---|---|
| Own profile/check-ins | RW | - | - | - | - | audited |
| Assigned cases | - | RW | RW | aggregate | aggregate | controlled |
| Individual sensitive text | own | assigned | restricted | no | no | audited |
| Emergency workflow | create | manage | manage | aggregate | aggregate | manage |
| Aggregated analytics | own | assigned | district | state | national | all |
| User administration | - | - | limited | limited | limited | yes |

Implement this matrix server-side. Hiding UI controls is not authorization.
